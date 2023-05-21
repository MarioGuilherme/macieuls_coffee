import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";

class ButtonTypeProduct extends StatelessWidget {
  final ProductType productType;

  const ButtonTypeProduct({
    super.key,
    required this.productType
  });

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>();

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .25),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 4)
            )
          ]
        ),
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: Observer(
              builder: (_) => InkWell(
                onTap: mainController.productTypeSelectedList == this.productType
                  ? null
                  : () => mainController.toggleProductTypeList(this.productType),
                child: Ink(
                  color: context.colors.secondary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        this.productType == ProductType.coffee
                          ? Icons.coffee
                          : Icons.cake,
                        size: 32,
                        color: this.productType == mainController.productTypeSelectedList
                            ? context.colors.primary
                            : const Color.fromRGBO(132, 132, 132, 1)
                      ),
                      const SizedBox(width: 1),
                      Text(
                        this.productType == ProductType.coffee
                          ? "Cafés"
                          : "Bolos",
                        style: context.textStyles.textBold.copyWith(
                          fontSize: 32,
                          color: this.productType == mainController.productTypeSelectedList
                            ? context.colors.primary
                            : const Color.fromRGBO(132, 132, 132, 1)
                        )
                      )
                    ]
                  )
                )
              )
            )
          )
        )
      )
    );
  }
}