import "package:flutter/material.dart";

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get textThin => const TextStyle(fontWeight: FontWeight.w100);

  TextStyle get textExtraLigth => const TextStyle(fontWeight: FontWeight.w200);

  TextStyle get textLight => const TextStyle(fontWeight: FontWeight.w300);

  TextStyle get textRegular => const TextStyle(fontWeight: FontWeight.normal);

  TextStyle get textMedium => const TextStyle(fontWeight: FontWeight.w500);

  TextStyle get textSemiBold => const TextStyle(fontWeight: FontWeight.w600);

  TextStyle get textBold => const TextStyle(fontWeight: FontWeight.bold);

  TextStyle get textExtraBold => const TextStyle(fontWeight: FontWeight.w800);

  TextStyle get textBlack => const TextStyle(fontWeight: FontWeight.w900);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}