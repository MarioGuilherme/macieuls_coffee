import "dart:core";

extension FormatEnumExtension on Enum {
  String get string => this.toString().split(".").last;
}