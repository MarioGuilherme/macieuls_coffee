import "dart:core";

import "package:intl/intl.dart";

extension FormatCurrencyExtension on double {
  String get currencyBR => NumberFormat.currency(
    locale: "pt_BR",
    symbol: "R\$",
  ).format(this);
}

extension FormatDoubleExtension on String {
  double get withOutCurrencyBRFormat => double.parse(this.replaceAll(RegExp(r"[^\d,]+"), "").replaceAll(",", "."));
  String get withCurrencyBRFormat {
    String price = this.replaceAll(RegExp(r"[^\d,]+"), "");

    final decimalIndex = price.indexOf(",");
    if (price.contains(",") && decimalIndex != -1 && decimalIndex + 3 <= price.length)
      price = price.substring(0, decimalIndex + 3);

    final List<String> houses = price.split(",");
    final String houseWithoutDecimal = houses.first;
    final List<String> parts = [];
    const int lengthOfPart = 3;

    for (int i = 0; i < houseWithoutDecimal.length; i += lengthOfPart) {
      final int end = (i + lengthOfPart <= houseWithoutDecimal.length) ? i + lengthOfPart : houseWithoutDecimal.length;
      parts.add(houseWithoutDecimal.substring(i, end));
    }

    if (houses.length == 2) {
      if (parts.length > 1) parts.last = parts.last.padLeft(3, "0");
      price = "R\$ ${parts.join(".")},${houses.last}";
    } else
      price = "R\$ ${parts.join(".")}";

    return price;
  }
}