

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:macieuls_coffee/app/core/extensions/format_currency_extension.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/core/ui/extensions/size_extensions.dart";
import "package:macieuls_coffee/app/core/ui/styles/text_styles.dart";
import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";
import "package:macieuls_coffee/app/pages/main/widgets/input_form.dart";

class ModalFormProduct extends StatelessWidget {
  final ProductModel? product;
  late final TextEditingController _nameEC;
  late final TextEditingController _descriptionEC;
  late final TextEditingController _priceEC;
  late final TextEditingController _imageUrl;
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ModalFormProduct({
    super.key,
    this.product
  });

  @override
  Widget build(BuildContext context) {
    MainController mainController = context.read<MainController>();
    this._nameEC = TextEditingController(text: this.product?.name ?? "");
    this._descriptionEC = TextEditingController(text: this.product?.description ?? "");
    this._priceEC = TextEditingController(text: this.product?.price.currencyBR ?? "");
    this._imageUrl = TextEditingController(text: this.product?.imageURL ?? "");
    mainController.setProductTypeForm(this.product?.type ?? ProductType.cake);
    mainController.setUrlImageForm(this.product?.imageURL);

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
                builder: (_) => ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: mainController.urlImageForm == null
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
                        imageUrl: mainController.urlImageForm!,
                        imageBuilder: (_, imageProvider) => Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        placeholder: (_, __) => const SizedBox(height: 150, width: 150, child: CircularProgressIndicator()),
                        errorWidget: (_, __, ___) {
                          mainController.setUrlImageForm(null);
                          return Container();
                        }
                      )
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
                      InputForm(
                        inputEC: this._imageUrl,
                        label: "URL da imagem",
                        textInputType: TextInputType.url,
                        onChanged: (url) async => mainController.setUrlImageForm(url)
                      ),
                      const SizedBox(height: 16),
                      InputForm(inputEC: this._nameEC, label: "Nome do produto", textInputType: TextInputType.text),
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
                            value: mainController.productTypeSelectedForm,
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
                      InputForm.multiline(inputEC: this._descriptionEC, label: "Descrição"),
                      const SizedBox(height: 16),
                      InputForm(
                        inputEC: this._priceEC,
                        label: "Preço",
                        textInputType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (price) => this._priceEC.value = this._priceEC.value.copyWith(
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
                child: ElevatedButton(
                  onPressed: () {
                    final bool isValid = this._formKey.currentState!.validate();
                    if (!isValid) return;

                    try {
                      var _ = CachedNetworkImage(imageUrl: this._imageUrl.text);
                    } catch (e) {
                      print("erro");
                    }

                    ProductModel product = ProductModel(
                      id: this.product!.id,
                      name: this._nameEC.text,
                      description: this._descriptionEC.text,
                      price: this._priceEC.text.withOutCurrencyBRFormat,
                      imageURL: this._imageUrl.text,
                      type: mainController.productTypeSelectedForm
                    );
                    this._descriptionEC.text
                      = this._imageUrl.text
                      = this._priceEC.text
                      = this._nameEC.text = "";
                    mainController.setUrlImageForm(null);
                    mainController.setProductTypeForm(ProductType.cake);
                    this.product == null
                      ? mainController.createProduct(product)
                      : mainController.updateProduct(product);
                    Navigator.pop(context);
                  },
                  child: Text(
                    this.product == null
                      ? "Cadastrar"
                      : "Salvar",
                    style: context.textStyles.textBold.copyWith(fontSize: 20)
                  )
                )
              )
            )
          ]
        ),
      )
    );
  }
}