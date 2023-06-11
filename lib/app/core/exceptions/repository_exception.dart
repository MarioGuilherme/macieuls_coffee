import "package:macieuls_coffee/app/core/exceptions/macieuls_coffee_exception.dart";

class RepositoryException implements MacieulsCoffeeException {
  @override
  final String message;

  RepositoryException({ required this.message });
}