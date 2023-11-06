import 'package:camera/camera.dart';

class CameraState {
  List<CameraDescription> cameras = [];
  CameraDescription get currentCamera => cameras[camera];
  
  int camera = 0;
  int flash = 1;  
  double zoom = 0;


  int switchFlash() {
    flash < 4 ? flash++ : flash = 1;
    return flash;
  }

  int switchCamera() {
    if (cameras.length > (camera + 1)) {
      camera++;
    } else {
      camera = 0;
    }
    return camera;
  }
}