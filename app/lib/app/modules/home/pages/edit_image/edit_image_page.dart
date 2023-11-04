import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../states/edit_image_state.dart';
import '../../stores/edit_image_store.dart';
import '../widgets/large_button.dart';

class EditImagePage extends StatefulWidget {
  final String title;
  final Uint8List picture;

  const EditImagePage({
    super.key,
    this.title = 'Editar imagem',
    required this.picture,
  });

  @override
  State<EditImagePage> createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  late final EditImageStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<EditImageStore>();
    store.setPicture(widget.picture);
  }

  @override
  void dispose() {
    Modular.dispose<EditImageStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ScopedBuilder<EditImageStore, EditImageState>(
          store: store,
          onLoading: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          onState: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ExtendedImage.memory(
                    state.picture!,
                    extendedImageEditorKey: store.editorKey,
                    mode: ExtendedImageMode.editor,
                    fit: BoxFit.contain,
                    initEditorConfigHandler: (state) {
                      return EditorConfig(
                        maxScale: 8.0,
                        hitTestSize: 20.0,
                        cropAspectRatio: CropAspectRatios.ratio1_1,
                        cropRectPadding: const EdgeInsets.all(20),
                        editorMaskColorHandler: (context, pointerDown) {
                          return Colors.black54;
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: store.rotatePictureLeft,
                        icon: const Icon(Icons.rotate_90_degrees_cw),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: store.rotatePictureRight,
                        icon: const Icon(Icons.rotate_90_degrees_ccw),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: store.flipPicture,
                        icon: const Icon(Icons.flip),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: store.resetPicture,
                        icon: const Icon(Icons.refresh),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                LargeButton(
                  onPressed: store.savePicture,
                  label: 'Continuar',
                  marginLeft: 8,
                  marginRight: 8,
                  marginBottom: 8,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
