
import "package:dio/dio.dart";

import "package:macieuls_coffee/app/core/config/env.dart";
import "package:macieuls_coffee/app/core/extensions/format_enum_extension.dart";

enum HttpMethod {
  GET,
  POST,
  PUT,
  DELETE
}

class HttpClient {
  final _dio = Dio(BaseOptions(baseUrl: Env.instance["urlAPI"] ?? ""));
  final _token = Env.instance["token"] ?? "";

  HttpClient() {
    this._dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true
    ));
  }

  Future<Response> restRequest(String resource, HttpMethod method, [Map<String, dynamic>? data]) async {
    Map<String, dynamic>? queryParameters;
    Options options;

    switch (method) {
      case HttpMethod.GET:
        queryParameters = { "token": this._token };
        options = Options(method: method.string);
        break;

      case HttpMethod.POST:
        data!.addAll({ "token": this._token });
        options = Options(
          method: method.string,
          contentType: Headers.formUrlEncodedContentType
        );
        break;

      case HttpMethod.PUT:
        data!.addAll({ "token": this._token });
        queryParameters = { "method": method.string };
        options = Options(
          method: HttpMethod.POST.string,
          contentType: Headers.formUrlEncodedContentType
        );
        break;

      case HttpMethod.DELETE:
        queryParameters = {
          "token": this._token,
          "method": method.string
        }..addAll(data!);
        options = Options(method: HttpMethod.GET.string);
        break;
    }

    return await this._dio.request(
      "$resource.php",
      options: options,
      queryParameters: queryParameters,
      data: data
    );
  }
}