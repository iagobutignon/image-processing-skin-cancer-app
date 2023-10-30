import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../states/camera_state.dart';
import '../../../stores/camera_store.dart';
import 'camera_icon.dart';

class CameraWidget extends StatefulWidget {
  final CameraStore store;
  final void Function()? onTakePicture;

  const CameraWidget({
    super.key,
    required this.store,
    this.onTakePicture,
  });

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  bool showFocusCircle = false;
  double x = 0;
  double y = 0;

  Future<void> _onTap(TapUpDetails details) async {
    if(widget.store.cameraController.value.isInitialized) {
      showFocusCircle = true;
      x = details.localPosition.dx;
      y = details.localPosition.dy;

      double fullWidth = MediaQuery.of(context).size.width;
      double cameraHeight = fullWidth * widget.store.cameraController.value.aspectRatio;

      double xp = x / fullWidth;
      double yp = y / cameraHeight;

      Offset point = Offset(xp,yp);

      // Manually focus
      await widget.store.cameraController.setFocusPoint(point);
      
      // Manually set light exposure
      //controller.setExposurePoint(point);
      
      setState(() {
        Future.delayed(const Duration(seconds: 2)).whenComplete(() {
          setState(() {
            showFocusCircle = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<CameraStore, CameraState>(
      store: widget.store,
      onLoading: (context) => const Expanded(
        child: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
      onError: (context, error) => Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(error.toString().replaceAll('Exception: ', '')),
          ),
        ),
      ),
      onState: (context, state) {
        Size size = MediaQuery.of(context).size;
        var minSize = (size.height < size.width ? size.height : size.width)
            .floor()
            .toDouble();
        return SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CameraPreview(
                widget.store.cameraController,
                child: Container(
                  color: Colors.black54,
                ),
              ).build(context),
              ClipRRect(
                child: SizedOverflowBox(
                  size: Size(minSize, minSize),
                  child: GestureDetector(
                    onTapUp: (details) {
                      _onTap(details);
                    },
                    child: CameraPreview(
                      widget.store.cameraController,
                      child: const Stack(
                        alignment: Alignment.center,
                      ),
                    ).build(context),
                  ),
                ),
              ),
              CameraIcon(
                icon: Icons.camera_alt,
                alignment: Alignment.bottomCenter,
                onPressed: widget.onTakePicture,
              ),
              CameraIcon(
                icon: Icons.flash_on,
                alignment: Alignment.bottomRight,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
