import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";

class InputForm extends StatelessWidget {
  static const Color _defaultInputBackground = Color.fromRGBO(245, 245, 245, 1);
  static const Color _defaultInputBorderColor = Color.fromRGBO(217, 217, 217, 1);
  static final OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: _defaultInputBorderColor),
    borderRadius: BorderRadius.circular(10)
  );

  final bool isMultiLine;
  final TextInputType textInputType;
  final String label;
  final TextEditingController inputEC;
  final void Function(String)? onChanged;

  const InputForm({
    super.key,
    required this.label,
    required this.textInputType,
    required this.inputEC,
    this.onChanged
  }) : this.isMultiLine = false;

  const InputForm.multiline({
    super.key,
    required this.label,
    required this.inputEC,
    this.onChanged
  }) : this.isMultiLine = true, this.textInputType = TextInputType.multiline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.trim().isEmpty ?? true)
          return "Preenche o campo \"${this.label}\" corretamente";
        return null;
      },
      onChanged: this.onChanged,
      controller: this.inputEC,
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
  }
}