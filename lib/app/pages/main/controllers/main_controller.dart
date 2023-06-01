import "dart:async";

import "package:mobx/mobx.dart";

import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/models/product_type.dart";
import "package:macieuls_coffee/app/repositories/products/products_repository.dart";

part "main_controller.g.dart";

class MainController = MainControllerBase with _$MainController;

abstract class MainControllerBase with Store {
  final ProductsRepository _productsRepository;

  MainControllerBase(this._productsRepository);

  @observable
  ObservableList<ProductModel> allProducts = ObservableList<ProductModel>();

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
  Future<void> loadProducts() async {
    this.allProducts.addAll(await this._productsRepository.getProducts());
  }

  @action
  Future<bool> createProduct(ProductModel product) async => await this._productsRepository.createProduct(product);

  @action
  Future<bool> updateProduct(ProductModel product) async => await this._productsRepository.updateProduct(product);

  @action
  Future<bool> deleteProduct(String idProduct) async => await this._productsRepository.deleteProduct(idProduct);
}