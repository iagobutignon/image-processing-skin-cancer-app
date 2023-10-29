import 'dart:typed_data';

class ProcessingState {
  Uint8List? baseImg;
  Uint8List? grayScaleImg;
  Uint8List? sobelmg;
  Uint8List? contourImg;
  List<int>? colorHistogram;
}