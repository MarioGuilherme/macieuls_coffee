import "package:macieuls_coffee/app/core/exceptions/macieuls_coffee_exception.dart";

class ControllerException implements MacieulsCoffeeException {
  @override
  final String message;

  ControllerException({ required this.message });
}