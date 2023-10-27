import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:image/image.dart' as img;
import 'package:image/image.dart';
import 'package:tcc_iago/app/modules/home/routes/home_routes.dart';

import '../states/edit_image_state.dart';

class EditImageStore extends Store<EditImageState> {
  late final GlobalKey<ExtendedImageEditorState> editorKey;

  EditImageStore() : super(EditImageState());

  Future<void> setPicture(Uint8List picture) async {
    setLoading(true, force: true);

    final aux = state;
    aux.picture = picture;
    await execute(() async => aux);

    setLoading(false, force: true);
  }

  Future<void> rotatePictureLeft() async =>
      editorKey.currentState?.rotate(right: false);

  Future<void> rotatePictureRight() async =>
      editorKey.currentState?.rotate(right: true);

  Future<void> flipPicture() async => editorKey.currentState?.flip();

  Future<void> resetPicture() async => editorKey.currentState?.reset();

  Future<void> savePicture() async {
    try {
      final editorState = editorKey.currentState;

      if (editorState == null) {
        return;
      }

      setLoading(true);
      final Uint8List result = await editImage(editorState);
      HomeRoutes.pop(result);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      setError(e);
      print(error);
    }
  }

  Future<Uint8List> editImage(ExtendedImageEditorState editorState) async {
    final EditActionDetails editAction = editorState.editAction!;
    Rect cropRect = editorState.getCropRect()!;
    final Uint8List data = editorState.rawImageData;

    if (data == editorState.rawImageData &&
        editorState.widget.extendedImageState.imageProvider
            is ExtendedResizeImage) {
      final ImmutableBuffer buffer =
          await ImmutableBuffer.fromUint8List(editorState.rawImageData);
      final ImageDescriptor descriptor = await ImageDescriptor.encoded(buffer);
      final double widthRatio = descriptor.width / editorState.image!.width;
      final double heightRatio = descriptor.height / editorState.image!.height;
      cropRect = Rect.fromLTRB(
        cropRect.left * widthRatio,
        cropRect.top * heightRatio,
        cropRect.right * widthRatio,
        cropRect.bottom * heightRatio,
      );
    }

    img.Image? src = await compute(decodeImage, data);

    if (src != null) {
      src.frames = src.frames.map((img.Image image) {
        image = bakeOrientation(image);

        if (editAction.needCrop) {
          image = img.copyCrop(
            image,
            x: cropRect.left.toInt(),
            y: cropRect.top.toInt(),
            width: cropRect.width.toInt(),
            height: cropRect.height.toInt(),
          );
        }

        if (editAction.needFlip) {
          late FlipDirection mode;
          if (editAction.flipY && editAction.flipX) {
            mode = FlipDirection.both;
          } else if (editAction.flipY) {
            mode = FlipDirection.horizontal;
          } else if (editAction.flipX) {
            mode = FlipDirection.vertical;
          }
          image = flip(image, direction: mode);
        }

        if (editAction.hasRotateAngle) {
          image = copyRotate(image, angle: editAction.rotateAngle);
        }

        return image;
      }).toList();
    }

    final fileData = await compute(encodeJpg, src!);

    return Uint8List.fromList(fileData);
  }

  @override
  void initStore() {
    editorKey = GlobalKey<ExtendedImageEditorState>();
    super.initStore();
  }
}
