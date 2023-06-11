import "package:dio/dio.dart";

import "package:macieuls_coffee/app/core/config/env.dart";
import "package:macieuls_coffee/app/core/http/adapter/adapter.dart";
import "package:macieuls_coffee/app/core/http/http_method.dart";

class HttpClient {
  final Adapter? adapter;

  final _dio = Dio(BaseOptions(baseUrl: Env.instance["urlAPI"] ?? ""));
  final _token = Env.instance["token"] ?? "";

  HttpClient(this.adapter) {
    this._dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true
    ));
  }

  Future<Response> restRequest(String resource, HttpMethod method, [Map<String, dynamic>? data]) async {
    Map<String, dynamic>? queryParameters;
    Options? options;

    if (this.adapter != null)
      (data, queryParameters, options) = this.adapter!.adapterHttp(method, this._token, data);

    return await this._dio.request(
      "$resource.php",
      options: options,
      queryParameters: queryParameters,
      data: data
    );
  }
}