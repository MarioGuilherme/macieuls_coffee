import "package:dio/dio.dart";

import "package:macieuls_coffee/app/core/extensions/format_enum_extension.dart";
import "package:macieuls_coffee/app/core/http/adapter/adapter.dart";
import "package:macieuls_coffee/app/core/http/http_method.dart";

class MacieulsCoffeeAdapterCORS extends Adapter {
  @override
  (Map<String, dynamic>?, Map<String, dynamic>?, Options) adapterHttp(
    HttpMethod method,
    String token,
    Map<String, dynamic>? data
  ) {
    Map<String, dynamic>? queryParameters;
    Options? options;

    switch (method) {
      case HttpMethod.GET:
        queryParameters = {"token": token};
        options = Options(method: method.string);
        break;
      case HttpMethod.POST:
        data!.addAll({"token": token});
        options = Options(
          method: method.string,
          contentType: Headers.formUrlEncodedContentType
        );
        break;
      case HttpMethod.PUT:
        data!.addAll({"token": token});
        queryParameters = { "method": method.string };
        options = Options(
          method: HttpMethod.POST.string,
          contentType: Headers.formUrlEncodedContentType
        );
        break;
      default:
        queryParameters = { "token": token, "method": method.string }..addAll(data!);
        options = Options(method: HttpMethod.GET.string);
        break;
    }

    return (data, queryParameters, options);
  }
}