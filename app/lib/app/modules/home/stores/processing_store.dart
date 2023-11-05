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

  Future<String> base(String id, String image) async {
    return image;
  }

  Future<String> toContour(String id, String image) async {
    await Future.delayed(const Duration(seconds: 2));

    final contourImg = await _imageProcessingService.toContour(image, id);
    return contourImg['image'];
  }

  Future<String> toGrayscale(String id, String image) async {
    await Future.delayed(const Duration(seconds: 3));

    final contourImg = await _imageProcessingService.toGrayscale(image, id);
    return contourImg['image'];
  }

  Future<String> toSobel(String id, String image) async {
    await Future.delayed(const Duration(seconds: 1));

    final contourImg = await _imageProcessingService.toSobel(image, id);
    return contourImg['image'];
  }

  Future<List<int>> getColorHistogram(String id, String image) async {
    await Future.delayed(const Duration(seconds: 2));

    final colorHistogram = await _imageProcessingService.getColorHistogram(image, id);
    return List<int>.from(colorHistogram['image']);
  }

  Future<void> setImage(Uint8List picture) async {
    try {
      setLoading(true, force: true);

      final aux = state;
      aux.baseImg = base64Encode(picture);
      aux.id = Guid.newGuid;

      setLoading(false, force: true);
      await execute(() async => aux);
    } catch (e) {
      setLoading(false, force: true);
      setError(e);
    }
  }

  Future<void> pushAnalysis() async {
    await HomeRoutes().pushAnalysis();
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