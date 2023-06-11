import "package:dio/dio.dart";

import "package:macieuls_coffee/app/core/http/http_method.dart";

abstract class Adapter {
  (Map<String, dynamic>?, Map<String, dynamic>?, Options) adapterHttp(
    HttpMethod method,
    String token,
    Map<String, dynamic>? data
  );
}