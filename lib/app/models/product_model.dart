import "package:macieuls_coffee/app/models/product_type.dart";

import "package:json_annotation/json_annotation.dart";

part "product_model.g.dart";

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "idProduto")
  final String? id;

  @JsonKey(name: "nome")
  final String name;

  @JsonKey(name: "descricao")
  final String description;

  @JsonKey(name: "preco")
  final String price;

  @JsonKey(name: "idCategoria")
  final ProductType type;

  @JsonKey(name: "foto")
  final String imageURL;

  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.type,
    required this.imageURL
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}