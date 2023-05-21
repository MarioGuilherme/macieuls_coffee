import "dart:core";

import "package:intl/intl.dart";

extension FormatCurrencytension on double {
  String get currencyBR => NumberFormat.currency(
    locale: "pt_BR",
    symbol: "R\$",
  ).format(this);
}