import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:tcc_iago/app/modules/home/states/processing_state.dart';

import '../routes/home_routes.dart';

class ProcessingStore extends Store<ProcessingState> {
  ProcessingStore() : super(ProcessingState());

  Future<void> setImage(Uint8List picture) async {
    final aux = state;
    aux.baseImg = picture;
    aux.contourImg = picture;
    aux.grayScaleImg = picture;
    aux.sobelmg = picture;
    aux.colorHistogram = await genenateMockHistogram();

    execute(() async => aux);
  }

  Future<void> pushAnalysis() async {
    await HomeRoutes.pushAnalysis();
  }

  Future<List<int>> genenateMockHistogram() async {
    List<int> list = [];

    for(int i = 0; i < 255; i ++) {
      list.add(Random().nextInt(8000));
    }

    return list;
  }
}