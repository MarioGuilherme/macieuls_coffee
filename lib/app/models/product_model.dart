import "package:macieuls_coffee/app/models/product_type.dart";

class ProductModel {
  final ProductType type;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.image
  });
}