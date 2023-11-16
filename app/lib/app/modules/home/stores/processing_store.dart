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

  Future<String> toGrayscale(String id, String image) async {
    final result = await _imageProcessingService.toGrayscale(image, id);
    final aux = state;
    aux.grayScaleImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }

  Future<String> toBlur(String id, String image) async {
    final result = await _imageProcessingService.toBlur(image, id);
    final aux = state;
    aux.blurredImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }
  
  Future<String> toContrast(String id, String image) async {
    final result = await _imageProcessingService.toContrast(image, id);
    final aux = state;
    aux.contrastedImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }

  Future<String> toDetail(String id, String image) async {
    final result = await _imageProcessingService.toDetail(image, id);
    final aux = state;
    aux.detailedImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }

  Future<String> toEmboss(String id, String image) async {
    final result = await _imageProcessingService.toEmboss(image, id);
    final aux = state;
    aux.embossedImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }

  Future<String> toContour(String id, String image) async {
    final result = await _imageProcessingService.toContour(image, id);
    final aux = state;
    aux.contourImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }

  Future<String> toSobel(String id, String image) async {
    final result = await _imageProcessingService.toSobel(image, id);
    final aux = state;
    aux.sobelImg = result['image'];
    await execute(() async => aux);
    return result['image'];
  }

  Future<List<int>> getColorHistogram(String id, String image) async {
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