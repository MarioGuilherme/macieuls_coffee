import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";

class DialogConfirmDelete extends StatelessWidget {
  final ProductModel product;

  const DialogConfirmDelete({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(40),
        width: context.percentWidth(.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Você realmente deseja excluir este item?",
              style: context.textStyles.textBold.copyWith(fontSize: 24, color: const Color.fromRGBO(132, 132, 132, 1))
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 65,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(132, 132, 132, 1)),
                      child: Text("Não", style: context.textStyles.textBold.copyWith(fontSize: 24))
                    )
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        mainController.deleteProduct(this.product);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(201, 36, 0, 1)),
                      child: Text("Excluir", style: context.textStyles.textBold.copyWith(fontSize: 24))
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