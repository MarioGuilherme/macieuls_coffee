import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/provider/application_binding.dart";
import "package:macieuls_coffee/app/core/ui/theme/theme_config.dart";
import "package:macieuls_coffee/app/pages/main/main_page.dart";

class MacieulsCoffeeApp extends StatelessWidget {
  const MacieulsCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Macieuls Coffee",
        theme: ThemeConfig.theme,
        routes: <String, Widget Function(BuildContext)>{
          "/": (BuildContext context) => const MainPage()
        }
      )
    );
  }
}