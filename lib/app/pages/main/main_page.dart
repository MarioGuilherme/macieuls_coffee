import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";
import "package:responsive_grid_list/responsive_grid_list.dart";

import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";
import "package:macieuls_coffee/app/pages/main/widgets/button_type_product.dart";
import "package:macieuls_coffee/app/pages/main/widgets/modal_form_product.dart";
import "package:macieuls_coffee/app/pages/main/widgets/navbar.dart";
import "package:macieuls_coffee/app/pages/main/widgets/product_tile.dart";

class MainPage extends StatelessWidget {
  const MainPage({ super.key });

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>();
    mainController.loadProducts();

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
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) => mainController.products.isEmpty
                      ? const Text("Vazio")
                      : ResponsiveGridList(
                        horizontalGridSpacing: 40,
                        verticalGridSpacing: 40,
                        verticalGridMargin: 30,
                        minItemWidth: 280,
                        minItemsPerRow: 1,
                        maxItemsPerRow: 10,
                        listViewBuilderOptions: ListViewBuilderOptions(shrinkWrap: true),
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
        onPressed: () => showDialog(
          context: context,
          builder: (context) => ModalFormProduct()
        )
      )
    );
  }
}