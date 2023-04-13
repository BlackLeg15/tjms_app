import 'package:dio/dio.dart';

import '../interfaces/http_client/http_client.dart';
import '../interfaces/http_client/http_exception.dart';
import '../interfaces/http_client/http_response.dart';

class HttpClientDioImp implements HttpClient {
  final Dio dio;

  const HttpClientDioImp(this.dio);

  @override
  Future<HttpResponse> get(String url, {Map<String, String> params = const {}}) async {
    try {
      final result = await dio.get(url, queryParameters: params);
      return HttpResponse(data: result.data);
    } on DioError catch (e) {
      throw HttpException(message: e.message ?? '', statusCode: e.response?.statusCode ?? 404);
    }
  }
}
