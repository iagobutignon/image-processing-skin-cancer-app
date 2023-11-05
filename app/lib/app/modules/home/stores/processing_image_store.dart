import 'package:flutter_triple/flutter_triple.dart';

class ProcessingImageStore extends Store<String> {
  ProcessingImageStore() : super('');

  Future<void> processImage({required String? id, required String? image, required Future<String> Function(String id, String image) f}) async {
    try {
      if (id == null || image == null) {
        return;
      }
      
      setLoading(true, force: true);
      
      final aux = await f(id, image);

      setLoading(false, force: true);
      await execute(() async => aux);
    } catch (e) {
      setLoading(false, force: true);
      setError(e);
    }
  }
}