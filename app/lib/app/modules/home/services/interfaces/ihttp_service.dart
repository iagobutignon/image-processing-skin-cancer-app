abstract class IHttpService {
  Future<dynamic> get({required String endpoint});
  Future<dynamic> post({required String endpoint, required Object data});
}
