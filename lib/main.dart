import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/config/env.dart";
import "package:macieuls_coffee/app/macieuls_coffee_app.dart";

void main() async {
  await Env.instance.load();
  runApp(const MacieulsCoffeeApp());
}