import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:tcc_iago/app/modules/home/states/processing_state.dart';

import '../routes/home_routes.dart';
import '../services/interfaces/iimage_processing_service.dart';
import '../types/guid.dart';

class ProcessingStore extends Store<ProcessingState> {
  final IImageProcessingService _imageProcessingService;
  
  ProcessingStore(this._imageProcessingService) : super(ProcessingState());

  Future<void> setImage(Uint8List picture) async {
    try {
      setLoading(true, force: true);

      final image = base64Encode(picture);

      final id = Guid.newGuid;

      final aux = state;
      aux.baseImg = picture;

      final contourImg = await _imageProcessingService.toContour(image, id);
      aux.contourImg = base64Decode(contourImg['image']);

      final grayScaleImg = await _imageProcessingService.toGrayscale(image, id);
      aux.grayScaleImg = base64Decode(grayScaleImg['image']);

      final sobelmg = await _imageProcessingService.toSobel(image, id);
      aux.sobelmg = base64Decode(sobelmg['image']);

      final colorHistogram = await _imageProcessingService.getColorHistogram(image, id);
      aux.colorHistogram = List<int>.from(colorHistogram['image']);

      setLoading(false, force: true);
      await execute(() async => aux);
    } catch (e) {
      setLoading(false, force: true);
      setError(e);
    }
  }

  Future<void> pushAnalysis() async {
    await HomeRoutes.pushAnalysis();
  }

  Future<void> refresh() async {
    setLoading(true, force: true);
    await Future.delayed(const Duration(seconds: 3));
    setLoading(false, force: true);
  }

  Future<List<int>> genenateMockHistogram() async {
    List<int> list = [];

    for(int i = 0; i < 255; i ++) {
      list.add(Random().nextInt(8000));
    }

    return list;
  }
}