import 'package:dio/dio.dart';

import 'interfaces/ihttp_service.dart';

class HttpService implements IHttpService {
  static const _url = "http://192.168.0.104:8000/";
  // static const _url = "http://";
  
  final Dio _dio = Dio(BaseOptions(
      // http://192.168.0.109:5000/  --> Endereço do Note
      ));

  @override
  Future<dynamic> get({
    required String endpoint,
  }) async {
    final response = await _dio.get(endpoint);

    return response.data;
  }

  @override
  Future post({
    required String endpoint,
    required Object data,
  }) async {
    final response = await _dio.post(
      '$_url$endpoint',
      data: data,
    );

    return response.data;
  }

  @override
  Future put({required String endpoint}) async {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future delete({required String endpoint}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
