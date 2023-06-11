import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";

class MessageDialog extends StatelessWidget {
  final String message;
  final Icon icon;

  const MessageDialog({super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(40),
        width: context.screenWidth >= 1096
          ? context.percentWidth(.35)
          : context.percentWidth(.90),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            this.icon,
            const SizedBox(height: 10),
            Text(
              this.message,
              textAlign: TextAlign.center,
              style: context.textStyles.textBold.copyWith(fontSize: 20, color: const Color.fromRGBO(132, 132, 132, 1))
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(backgroundColor: context.colors.primary),
                      child: Text("Ok", style: context.textStyles.textBold.copyWith(fontSize: 18))
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}