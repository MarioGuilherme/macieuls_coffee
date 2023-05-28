import "package:macieuls_coffee/app/models/product_type.dart";

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final ProductType type;
  final String imageURL;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.type,
    required this.imageURL
  });
}