import 'dart:convert';

import 'package:flutter_triple/flutter_triple.dart';

import '../routes/home_routes.dart';
import '../services/interfaces/iimage_processing_service.dart';
import '../states/home_state.dart';
import '../types/guid.dart';

class HomeStore extends Store<HomeState> {
  final IImageProcessingService _imageProcessingService;

  HomeStore(this._imageProcessingService) : super(HomeState());

  Future<void> pushCamera() async {
    var picture = await HomeRoutes.pushCamera();

    if (picture == null) {
      return;
    }

    picture = await HomeRoutes.pushEditImage(picture) ?? picture;
    
    final base64Img = base64Encode(picture);
    final id = Guid.newGuid;
    final sobelTemp = await _imageProcessingService.toSobel(base64Img, id);
    final sobelImg = base64Decode(sobelTemp['image']);
    final contourTemp = await _imageProcessingService.toContour(base64Img, id);
    final contourImg = base64Decode(contourTemp['image']);
    final grayScaleTemp = await _imageProcessingService.toGrayscale(base64Img, id);
    final grayScaleImg = base64Decode(grayScaleTemp['image']);
    final colorHistogramTemp = await _imageProcessingService.getColorHistogram(base64Img, id);
    final colorHistogram = List<int>.from(colorHistogramTemp['image']);
  
    final aux = state;
    aux.baseImg = picture;
    aux.sobelmg = sobelImg;
    aux.contourImg = contourImg;
    aux.grayScaleImg = grayScaleImg;
    aux.colorHistogram = colorHistogram;

    await execute(() async => aux);
  }
}
