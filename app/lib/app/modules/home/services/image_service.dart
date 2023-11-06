import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';

import 'interfaces/iimage_service.dart';

class ImageService extends IImageService {
  @override
  Future<Uint8List?> getImageFromGallery() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    return await result?.readAsBytes();
  }

  @override
  Future<Uint8List?> editImage(ExtendedImageEditorState state) async {
    final Rect? cropRect = state.getCropRect();
    final EditActionDetails editAction = state.editAction!;
    var data = state.rawImageData;

    Image? src = await compute(decodeImage, data);

    if (src == null) {
      return null;
    }

    src = bakeOrientation(src);

    if (editAction.needCrop && cropRect != null) {
      src = copyCrop(
        src,
        x: cropRect.left.toInt(),
        y: cropRect.top.toInt(),
        width: cropRect.width.toInt(),
        height: cropRect.height.toInt(),
      );
    }

    if (editAction.needFlip) {
      FlipDirection? direction;

      if (editAction.flipY && editAction.flipX) {
        direction = FlipDirection.both;
      }

      if (editAction.flipY) {
        direction = FlipDirection.horizontal;
      }

      if (editAction.flipX) {
        direction = FlipDirection.vertical;
      }

      if (direction != null) {
        src = flip(src, direction: direction);
      }
    }

    if (editAction.hasRotateAngle) {
      src = copyRotate(src, angle: editAction.rotateAngle);
    }

    var fileData = await compute(encodeJpg, src);

    return fileData;
  }
}
