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

  List<ProductModel> get products => this.allProducts.where((p) => p.type == this.productTypeSelectedList).toList();

  @observable
  ProductType productTypeSelectedList = ProductType.cake;

  @observable
  ProductType productTypeSelectedForm = ProductType.cake;

  @observable
  DateTime dateTime = DateTime.now();

  @action
  void initTimer() {
    Timer.periodic(const Duration(milliseconds: 333), (timer) {
      final DateTime now = DateTime.now();
      this.dateTime = DateTime(0, 0, 0, now.hour, now.minute, now.second);
    });
  }

  @action
  void toggleProductTypeList(ProductType productType) => this.productTypeSelectedList = productType;

  @action
  void toggleProductTypeForm(ProductType productType) => this.productTypeSelectedForm = productType;

  @action
  void deleteProduct(ProductModel product) => this.allProducts.removeWhere((p) => p == product);
}