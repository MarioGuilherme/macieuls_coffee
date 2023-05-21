import "package:flutter/material.dart";

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    ColorsApp._instance ??= ColorsApp._();
    return ColorsApp._instance!;
  }

  Color get primary => const Color.fromRGBO(49, 190, 0, 1);
  Color get secondary => Colors.white;
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}