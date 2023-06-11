import "dart:developer";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/exceptions/controller_exception.dart";
import "package:macieuls_coffee/app/core/exceptions/macieuls_coffee_exception.dart";
import "package:macieuls_coffee/app/core/extensions/format_currency_extension.dart";
import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/colors_app.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";
import "package:macieuls_coffee/app/pages/main/widgets/input_form.dart";
import "package:macieuls_coffee/app/pages/main/widgets/message_dialog.dart";

class ModalFormProduct extends StatelessWidget {
  TextEditingController? _imageUrlEC;
  TextEditingController? _nameEC;
  TextEditingController? _descriptionEC;
  TextEditingController? _priceEC;
  final ProductModel? product;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ModalFormProduct({
    super.key,
    this.product
  });

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = this.product != null;
    final MainController mainController = context.read<MainController>();

    mainController.setImagePreview(this.product?.imageURL);
    mainController.setProductTypeForm(this.product?.type ?? ProductType.cake);
    this._imageUrlEC ??= TextEditingController(text: this.product?.imageURL ?? "");
    this._nameEC ??= TextEditingController(text: this.product?.name ?? "");
    this._descriptionEC ??= TextEditingController(text: this.product?.description ?? "");
    this._priceEC ??= TextEditingController(text: this.product?.price ?? "");

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: context.screenWidth >= 1096
          ? context.percentWidth(.35)
          : context.percentWidth(.90),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Observer(
                builder: (_) => Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      child: mainController.productImageURL == null
                        ? Container(
                            width: double.infinity,
                            color: Colors.grey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image, size: 50, color: Colors.white),
                                const SizedBox(height: 25),
                                Text("Sua imagem ficará aqui!", style: context.textStyles.textBold.copyWith(fontSize: 18, color: Colors.white))
                              ]
                            )
                          )
                        : CachedNetworkImage(
                            imageUrl: mainController.productImageURL!,
                            imageBuilder: (_, imageProvider) => Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              width: double.infinity
                            ),
                            placeholder: (_, __) => const SizedBox(height: 150, width: 150, child: CircularProgressIndicator()),
                            errorWidget: (_, __, ___) {
                              mainController.setImagePreview(null);
                              return Container();
                            }
                          )
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: mainController.isWaitingForAPISave ? null : () => Navigator.pop(context),
                          child: Ink(child: const Icon(Icons.close))
                        )
                      )
                    )
                  ]
                )
              )
            ),
            Container(
              height: context.percentHeigth(0.45),
              padding: const EdgeInsets.only(bottom: 16, left: 32, right: 32, top: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: this._formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      InputForm(
                        inputEC: this._imageUrlEC!,
                        label: "URL da imagem",
                        textInputType: TextInputType.url,
                        onChanged: (url) => mainController.setImagePreview(url)
                      ),
                      const SizedBox(height: 16),
                      InputForm(inputEC: this._nameEC!, label: "Nome do produto", textInputType: TextInputType.text),
                      const SizedBox(height: 16),
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
                            value: mainController.productTypeForm,
                            style: context.textStyles.textBold.copyWith(fontSize: 20, color: const Color.fromRGBO(132, 132, 132, 1)),
                            onChanged: (ProductType? productType) => mainController.setProductTypeForm(productType!),
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
                      InputForm.multiline(inputEC: this._descriptionEC!, label: "Descrição"),
                      const SizedBox(height: 16),
                      InputForm(
                        inputEC: this._priceEC!,
                        label: "Preço",
                        textInputType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (price) => this._priceEC!.value = this._priceEC!.value.copyWith(
                          text: price.withCurrencyBRFormat,
                          selection: TextSelection.collapsed(offset: price.withCurrencyBRFormat.length)
                        )
                      )
                    ]
                  )
                )
              )
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 32, left: 32, right: 32),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Observer(
                  builder: (_) => ElevatedButton(
                    onPressed: mainController.isWaitingForAPISave
                      ? null
                      : () async {
                        try {
                          if (!this._formKey.currentState!.validate()) return;

                          final ProductModel product = ProductModel(
                            id: this.product?.id,
                            name: this._nameEC!.text.trim(),
                            description: this._descriptionEC!.text.trim(),
                            price: this._priceEC!.text,
                            imageURL: this._imageUrlEC!.text.trim(),
                            type: mainController.productTypeForm
                          );

                          final bool isSuccess = await mainController.saveProduct(product, isUpdate: isUpdate);

                          if (!isSuccess) throw ControllerException(message: "Erro ao atualizar o produto!");

                          mainController.reloadProducts();

                          if (isUpdate && context.mounted)
                            Navigator.pop(context);
                          else {
                            this._imageUrlEC!.text = "";
                            this._nameEC!.text = "";
                            this._descriptionEC!.text = "";
                            this._priceEC!.text = "";
                            mainController.clearForm();
                          }

                          if (context.mounted)
                            showDialog(
                              context: context,
                              builder: (_) => MessageDialog(
                                message: "Produto ${isUpdate ? "atualizado" : "cadastrado"} com êxito",
                                icon: Icon(Icons.check_circle, color: context.colors.primary, size: 64)
                              )
                            );
                        } on MacieulsCoffeeException catch (e, s) {
                          mainController.setIsWaitingAPISave(false);
                          log("Erro", stackTrace: s);
                          showDialog(
                            context: context,
                            builder: (_) => MessageDialog(
                              message: e.message,
                              icon: const Icon(Icons.error, color: Colors.red, size: 64)
                            )
                          );
                        }
                      },
                    child: mainController.isWaitingForAPISave
                      ? const CircularProgressIndicator()
                      : Text(isUpdate ? "Salvar" : "Cadastrar", style: context.textStyles.textBold.copyWith(fontSize: 20))
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}