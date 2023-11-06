import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../states/camera_state.dart';
import '../../stores/camera_store.dart';
import 'widgets/camera_widget.dart';

class CameraPage extends StatefulWidget {
  final String title;

  const CameraPage({
    super.key,
    this.title = 'Camera',
  });

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late final CameraStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<CameraStore>();
  }

  @override
  void dispose() {
    Modular.dispose<CameraStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 4,
        ),
        body: ScopedBuilder<CameraStore, CameraState>(
          store: store,
          onLoading: (context) => const Center(child: CircularProgressIndicator()),
          onState: (context, state) {
            return CameraWidget(
              store: store,
              onTakePicture: store.takePicture,
              switchCamera: store.switchCamera,
              switchFlash: store.switchFlash,
            );
          },
        ),
      ),
    );
  }
}
