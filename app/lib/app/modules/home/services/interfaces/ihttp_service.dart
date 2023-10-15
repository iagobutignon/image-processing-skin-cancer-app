abstract class IHttpService {
  Future<dynamic> get({required String endpoint});
  Future<dynamic> post({required String endpoint, required Object data});
  Future<dynamic> put({required String endpoint});
  Future<dynamic> delete({required String endpoint});
}
