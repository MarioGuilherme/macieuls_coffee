import "dart:async";

import "package:mobx/mobx.dart";

import "package:macieuls_coffee/app/data/mocked_data.dart";
import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/models/product_type.dart";

part "main_controller.g.dart";

class MainController = MainControllerBase with _$MainController;

abstract class MainControllerBase with Store {
  @observable
  ObservableList<ProductModel> allProducts = ObservableList<ProductModel>()..addAll(mockedData);

  List<ProductModel> get products => this.allProducts.where((p) => p.type == this.productTypeSelected).toList();

  @observable
  ProductType productTypeSelected = ProductType.cake;

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  String? urlImageForm;

  @action
  void initTimer() {
    Timer.periodic(const Duration(milliseconds: 333), (timer) {
      final DateTime now = DateTime.now();
      this.dateTime = DateTime(0, 0, 0, now.hour, now.minute, now.second);
    });
  }

  @action
  void setProductType(ProductType productType) => this.productTypeSelected = productType;

  @action
  void createProduct(ProductModel product) => this.allProducts.add(product);

  @action
  void updateProduct(ProductModel newProduct) {
    final ProductModel productToUpdate = this.allProducts.firstWhere((product) => product.id == newProduct.id);
    final int index = this.allProducts.indexOf(productToUpdate);
    this.allProducts[index] = newProduct;
  }

  @action
  void deleteProduct(int idProduct) => this.allProducts.removeWhere((product) => product.id == idProduct);
}