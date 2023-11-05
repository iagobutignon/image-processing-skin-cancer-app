import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:image/image.dart';

import '../routes/home_routes.dart';
import '../states/camera_state.dart';

class CameraStore extends Store<CameraState> {
  late final CameraController cameraController;

  CameraStore() : super(CameraState());

  Future<void> takePicture() async {
    if (!cameraController.value.isInitialized ||
        cameraController.value.isTakingPicture) {
      return;
    }
    final XFile pictureFile = await cameraController.takePicture();
    final Uint8List pictureBytes = await pictureFile.readAsBytes();
    final Uint8List croppedImage = await cropPicture(pictureBytes);

    HomeRoutes().pushEditImage(croppedImage);
  }

  Future<Uint8List> cropPicture(Uint8List picture) async {
    final Image? temp = decodeImage(picture);

    if (temp == null) {
      throw Exception("Imagem inválida");
    }

    final minSize = temp.height < temp.width ? temp.height : temp.width;
    final x = temp.height > temp.width ? 0 : temp.width ~/ 2;
    final y = minSize - temp.height ~/ 2;
    Image image = copyCrop(temp, x: x, y: y, width: minSize, height: minSize);
    return encodeJpg(image);
  }

  @override
  Future<void> initStore() async {
    try {
      setLoading(true);
      final cameras = await availableCameras();
      final camera = cameras.first;

      cameraController = CameraController(
        camera,
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await cameraController.initialize();
      await cameraController.lockCaptureOrientation(DeviceOrientation.portraitUp);
      await cameraController.setFlashMode(FlashMode.off);

      setLoading(false);
      final aux = state;
      await execute(() async => aux);
    } on Exception catch (_) {
      setLoading(false);
      setError(Exception('Erro $_'));
    }
  }

  Future<void> switchFlash() async {
    try {
      final aux = state;
      aux.flash = state.switchFlash();
      update(aux, force: true);
      switch (aux.flash) {
        case 1:
          await cameraController.setFlashMode(FlashMode.off);
          break;
        case 2:
          await cameraController.setFlashMode(FlashMode.auto);
          break;
        case 3:
          await cameraController.setFlashMode(FlashMode.always);
          break;
        case 4:
          await cameraController.setFlashMode(FlashMode.torch);
          break;
        default:
          await cameraController.setFlashMode(FlashMode.off);
          break;
      }
    } on Exception catch (_) {
      setError(Exception('Não foi possível ligar o flash'));
      await Future.delayed(const Duration(seconds: 2));
      final aux = state;
      execute(() async => aux);
    }
  }

  @override
  Future destroy() {
    cameraController.dispose();
    return super.destroy();
  }
}
