import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;
  DioConsumer({
    required this.dio,
    String? token,
    String langue = "en",
  }) {
    Map<String, dynamic> headers = {
      ApiKeys.language: langue,
    };
    if (token != null) {
      headers.addAll({
        ApiKeys.authorization: token,
      });
    }
    dio
      ..options.headers = headers
      ..options.baseUrl = EndPoints.baseUrl
      ..interceptors
          .add(LogInterceptor(error: true, request: true, responseBody: true));
  }
  @override
  Future delete(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response =
        await dio.delete(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response =
        await dio.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future patch(
      {required String endPoint,
      bool isFormData = false,
      Map<String, dynamic>? bodyData,
      Map<String, dynamic>? queryParameters}) async {
    Response response = await dio.patch(endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(bodyData!) : bodyData);
    return response.data;
  }

  @override
  Future post(
      {required String endPoint,
      bool isFormData = false,
      Map<String, dynamic>? bodyData,
      Map<String, dynamic>? queryParameters}) async {
    Response response = await dio.post(endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(bodyData!) : bodyData);
    return response.data;
  }

  @override
  Future put(
      {required String endPoint,
      bool isFormData = false,
      Map<String, dynamic>? bodyData,
      Map<String, dynamic>? queryParameters}) async {
    Response response = await dio.put(endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(bodyData!) : bodyData);
    return response.data;
  }
}
