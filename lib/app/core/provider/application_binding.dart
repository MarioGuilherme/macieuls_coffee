import "package:flutter/material.dart";
import "package:macieuls_coffee/app/core/http/adapter/macieuls_coffee_adapter_cors.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/http/http_client.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";
import "package:macieuls_coffee/app/repositories/products/products_repository.dart";
import "package:macieuls_coffee/app/repositories/products/products_repository_impl.dart";

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <Provider>[
        Provider<HttpClient>(create: (BuildContext context) => HttpClient(MacieulsCoffeeAdapterCORS())),
        Provider<ProductsRepository>(create: (BuildContext context) => ProductsRepositoryImpl(httpClient: context.read())),
        Provider<MainController>(create: (BuildContext context) => MainController(context.read()))
      ],
      child: this.child
    );
  }
}