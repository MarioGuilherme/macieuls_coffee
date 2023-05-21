import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";
import "package:macieuls_coffee/app/pages/main/widgets/input_form.dart";

class DialogFormProduct extends StatelessWidget {
  const DialogFormProduct({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(32),
        width: context.percentWidth(.45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromRGBO(217, 217, 217, 1)),
                color: const Color.fromRGBO(245, 245, 245, 1)
              ),
              child: Observer(
                builder: (_) => DropdownButton<ProductType>(
                  icon: const Icon(Icons.arrow_drop_down, size: 28, color: Color.fromRGBO(217, 217, 217, 1)),
                  underline: Container(),
                  value: mainController.productTypeSelectedForm,
                  style: context.textStyles.textBold.copyWith(fontSize: 20, color: const Color.fromRGBO(132, 132, 132, 1)),
                  onChanged: (ProductType? productType) {
                    mainController.toggleProductTypeForm(productType!);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: ProductType.cake,
                      child: Text("Bolo")
                    ),
                    DropdownMenuItem(
                      value: ProductType.coffee,
                      child: Text("Café")
                    )
                  ]
                )
              )
            ),
            const SizedBox(height: 16),
            const InputForm(label: "Nome do produto", textInputType: TextInputType.text),
            const SizedBox(height: 16),
            const InputForm.multiline(label: "Descrição"),
            const SizedBox(height: 16),
            const InputForm(label: "Preço", textInputType: TextInputType.number),
            const SizedBox(height: 16),
            const InputForm(label: "URL da imagem", textInputType: TextInputType.url),
            const SizedBox(height: 20),
            SizedBox(
              height: 75,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Cadastrar", style: context.textStyles.textBold.copyWith(fontSize: 32))
              )
            )
          ]
        )
      )
    );
  }
}