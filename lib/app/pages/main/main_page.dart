import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";
import "package:macieuls_coffee/app/pages/main/widgets/button_type_product.dart";
import "package:macieuls_coffee/app/pages/main/widgets/dialog_form_product.dart";
import "package:macieuls_coffee/app/pages/main/widgets/navbar.dart";
import "package:macieuls_coffee/app/pages/main/widgets/product_tile.dart";

class MainPage extends StatelessWidget {
  const MainPage({ super.key });

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 50,
                left: context.percentWidth(.08),
                right: context.percentWidth(.08)
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTypeProduct(productType: ProductType.cake),
                      SizedBox(width: 35),
                      ButtonTypeProduct(productType: ProductType.coffee)
                    ]
                  ),
                  const SizedBox(height: 50),
                  Observer(
                    builder: (_) => GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      crossAxisCount: (context.screenWidth / 320).floor(),
                      children: mainController.products.map((product) => ProductTile(product: product)).toList()
                    )
                  )
                ]
              )
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.primary,
        child: const Icon(Icons.add, size: 32),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const DialogFormProduct()
          );
        }
      )
    );
  }
}