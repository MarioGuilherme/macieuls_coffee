import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";

class ThemeConfig {
  ThemeConfig._();

  static final ThemeData theme = ThemeData(
    fontFamily: "inter",
    scaffoldBackgroundColor: ColorsApp.instance.secondary,
    primaryColor: ColorsApp.instance.primary,
    textSelectionTheme: TextSelectionThemeData(selectionColor: ColorsApp.instance.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      )
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary
    )
  );
}