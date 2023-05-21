import "dart:core";

extension FormatTimeExtension on DateTime {
  String get formatBR => RegExp(r"\d{2}:\d{2}:\d{2}").stringMatch(this.toString())!;
}