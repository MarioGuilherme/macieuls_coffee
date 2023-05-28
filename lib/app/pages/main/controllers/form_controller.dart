import "package:macieuls_coffee/app/models/product_type.dart";
import "package:mobx/mobx.dart";

part "form_controller.g.dart";

class FormController = FormControllerBase with _$FormController;

abstract class FormControllerBase with Store {
  @observable
  String productName = "";

  @observable
  String productDescription = "";

  @observable
  String productPrice = "";

  @observable
  String? productImageURL;

  @observable
  ProductType productType = ProductType.cake;

  @action
  void setName(String name) => this.productName = name;

  @action
  void setDescription(String description) => this.productDescription = description;

  @action
  void setPrice(String price) => this.productPrice = price;

  @action
  void setImageUrl(String? imageUrl) => this.productImageURL = imageUrl;

  @action
  void setProductType(ProductType productType) => this.productType = productType;

  @action
  void clearForm() {
    this.productName = "";
    this.productDescription = "";
    this.productPrice = "";
    this.productImageURL = "";
    this.productType = ProductType.cake;
  }
}