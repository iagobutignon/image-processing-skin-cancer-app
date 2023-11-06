import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';

abstract class IImageService {
  Future<Uint8List?> getImageFromGallery();
  Future<Uint8List?> editImage(ExtendedImageEditorState state);
}