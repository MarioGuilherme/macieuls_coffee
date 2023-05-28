import "package:mobx/mobx.dart";

import "package:macieuls_coffee/app/models/product_type.dart";

part "form_controller.g.dart";

class FormController = FormControllerBase with _$FormController;

abstract class FormControllerBase with Store {
  @observable
  String? productImageURL;

  @observable
  ProductType? productType;

  @action
  void setImagePreview(String? imageUrl) => this.productImageURL = imageUrl;

  @action
  void setProductType(ProductType productType) => this.productType = productType;

  @action
  void clear() {
    this.productImageURL = null;
    this.productType = null;
  }
}