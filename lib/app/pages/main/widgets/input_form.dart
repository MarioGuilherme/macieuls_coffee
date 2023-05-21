import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";

class InputForm extends StatelessWidget {
  static const Color _defaultInputBackground = Color.fromRGBO(245, 245, 245, 1);
  static const Color _defaultInputBorderColor = Color.fromRGBO(217, 217, 217, 1);

  final bool isMultiLine;
  final TextInputType textInputType;
  final String label;

  const InputForm({
    super.key,
    required this.label,
    required this.textInputType
  }) : this.isMultiLine = false;

  const InputForm.multiline({
    super.key,
    required this.label
  }) : this.isMultiLine = true, this.textInputType = TextInputType.multiline;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder defaultInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: this.isMultiLine ? Colors.transparent : _defaultInputBorderColor),
      borderRadius: BorderRadius.circular(10)
    );

    final TextFormField textFormField = TextFormField(
      keyboardType: this.textInputType,
      style: context.textStyles.textSemiBold.copyWith(fontSize: 18),
      cursorColor: context.colors.primary,
      maxLines: this.isMultiLine ? null : 1,
      decoration: InputDecoration(
        labelText: this.label,
        filled: true,
        fillColor: _defaultInputBackground,
        hoverColor: _defaultInputBackground,
        focusColor: _defaultInputBackground,
        enabledBorder: defaultInputBorder,
        disabledBorder: defaultInputBorder,
        errorBorder: defaultInputBorder,
        border: defaultInputBorder,
        focusedBorder: defaultInputBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        labelStyle: context.textStyles.textBold.copyWith(fontSize: 20, color: const Color.fromARGB(255, 173, 173, 173))
      )
    );

    return this.isMultiLine
      ? Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _defaultInputBorderColor),
            color: _defaultInputBackground
          ),
          child: textFormField
        )
      : textFormField;
  }
}