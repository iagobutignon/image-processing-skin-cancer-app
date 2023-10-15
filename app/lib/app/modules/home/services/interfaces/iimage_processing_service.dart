abstract class IImageProcessingService {
  Future<Map<String, dynamic>> toSobel(String image, String id);
  Future<Map<String, dynamic>> toContour(String image, String id);
  Future<Map<String, dynamic>> toGrayscale(String image, String id);
  Future<Map<String, dynamic>> getColorHistogram(String image, String id);
}