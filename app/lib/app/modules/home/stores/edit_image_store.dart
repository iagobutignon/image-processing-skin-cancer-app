import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tcc_iago/app/modules/home/routes/home_routes.dart';

import '../services/interfaces/iimage_service.dart';
import '../states/edit_image_state.dart';

class EditImageStore extends Store<EditImageState> {
  late final GlobalKey<ExtendedImageEditorState> editorKey;
  final IImageService _imageService;

  EditImageStore(this._imageService) : super(EditImageState());

  Future<void> setPicture(Uint8List picture) async {
    setLoading(true, force: true);

    final aux = state;
    aux.picture = picture;
    await execute(() async => aux);

    setLoading(false, force: true);
  }

  Future<void> rotatePictureLeft() async => editorKey.currentState?.rotate(right: false);
  Future<void> rotatePictureRight() async => editorKey.currentState?.rotate(right: true);
  Future<void> flipPicture() async => editorKey.currentState?.flip();
  Future<void> resetPicture() async => editorKey.currentState?.reset();

  Future<void> savePicture() async {
    try {
      final editorState = editorKey.currentState;

      if (editorState == null) {
        return;
      }

      setLoading(true);
      final Uint8List? result = await _imageService.editImage(editorState);
      if (result == null) {
        throw Exception('Erro ao editar imagem');
      }

      HomeRoutes().pushProcessing(result);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      setError(e);
    }
  }

  @override
  void initStore() {
    editorKey = GlobalKey<ExtendedImageEditorState>();
    super.initStore();
  }
}
