import 'dart:typed_data';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_routes.dart';

class HomeRoutes extends AppRoutes {
  final home = '/';
  final changePassword = '/change_password/';
  final camera = '/camera/';
  final editImage = '/edit_image/';
  final processing = '/processing/';
  final analysis = '/analysis/';

  Future<dynamic> pushChangePassword() async {
    return await Modular.to.pushNamed(
      '$homeModule$changePassword'.removeDoubleSlash(),
    );
  }

  Future<Uint8List?> pushCamera() async {
    return await Modular.to.pushNamed(
      '$homeModule$camera'.removeDoubleSlash(),
    );
  }

  Future<Uint8List?> pushEditImage(Uint8List picture) async {
    return await Modular.to.pushNamed(
      '$homeModule$editImage'.removeDoubleSlash(),
      arguments: picture,
    );
  }

  Future<void> pushProcessing(Uint8List picture) async {
    await Modular.to.pushNamed(
      '$homeModule$processing'.removeDoubleSlash(),
      arguments: picture,
    );
  }

  Future<void> pushAnalysis() async {
    await Modular.to.pushNamed(
      '$homeModule$analysis'.removeDoubleSlash(),
    );
  }

  Future<dynamic> pop([dynamic args]) async {
    Modular.to.pop(args);
  }
}
