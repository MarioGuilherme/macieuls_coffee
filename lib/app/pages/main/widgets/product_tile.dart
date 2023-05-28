import "package:flutter/material.dart";

import "package:macieuls_coffee/app/core/extensions/format_currency_extension.dart";
import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/pages/main/widgets/modal_confirm_delete.dart";
import "package:macieuls_coffee/app/pages/main/widgets/modal_form_product.dart";

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.secondary,
        border: Border.all(color: const Color.fromRGBO(207, 207, 207, 1)),
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              this.product.imageURL,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.product.name,
                  style: context.textStyles.textBold.copyWith(color: Colors.black, fontSize: 18)
                ),
                Text(
                  this.product.price.currencyBR,
                  style: context.textStyles.textBold.copyWith(fontSize: 16, color: context.colors.primary)
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ModalFormProduct(product: this.product)
                            );
                          },
                          icon: const Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(132, 132, 132, 1)),
                          label: Text("Editar", style: context.textStyles.textBold.copyWith(fontSize: 16))
                        )
                      )
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ModalConfirmDelete(product: this.product)
                            );
                          },
                          icon: const Icon(Icons.delete),
                          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(201, 36, 0, 1)),
                          label: Text(
                            "Excluir",
                            style: context.textStyles.textBold.copyWith(fontSize: 16)
                          )
                        )
                      )
                    )
                  ]
                )
              ]
            )
          )
        ]
      )
    );
  }
}