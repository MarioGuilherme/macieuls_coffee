import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/extensions/format_time_exntension.dart";
import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>()..initTimer();

    return Container(
      height: 95,
      color: const Color.fromRGBO(49, 190, 0, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Image.asset("assets/images/logo.png")
          ),
          Row(
            children: [
              Observer(
                builder: (_) => Text(
                  mainController.dateTime.formatBR,
                  style: context.textStyles.textRegular.copyWith(fontSize: 18, color: context.colors.secondary)
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    VerticalDivider(color: context.colors.secondary),
                    const SizedBox(width: 7),
                    Text("Admin", style: context.textStyles.textRegular.copyWith(fontSize: 18, color: context.colors.secondary)),
                    const SizedBox(width: 8),
                    Icon(Icons.person, color: context.colors.secondary, size: 32)
                  ]
                )
              )
            ]
          )
        ]
      )
    );
  }
}