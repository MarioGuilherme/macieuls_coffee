import "package:json_annotation/json_annotation.dart";

enum ProductType {
  @JsonValue("1") cake,
  @JsonValue("2") coffee
}