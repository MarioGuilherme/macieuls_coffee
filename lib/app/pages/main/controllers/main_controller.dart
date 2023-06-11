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

  List<ProductModel> get products => this.allProducts.where((p) => p.type == this.productTypeList).toList();

  @observable
  bool isWaitingForAPIFetch = false;

  @observable
  bool isWaitingForAPISave = false;

  @observable
  bool isWaitingForAPIDelete = false;

  @observable
  ObservableList<ProductModel> allProducts = ObservableList<ProductModel>();

  @observable
  ProductType productTypeList = ProductType.cake;

  @observable
  ProductType productTypeForm = ProductType.cake;

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  String? productImageURL;

  @action
  void initTimer() {
    Timer.periodic(const Duration(milliseconds: 333), (timer) {
      final DateTime now = DateTime.now();
      this.dateTime = DateTime(0, 0, 0, now.hour, now.minute, now.second);
    });
  }

  @action
  void clearForm() {
    this.productImageURL = null;
    this.productTypeForm = ProductType.cake;
  }

  @action
  void setIsWaitingAPIFetch(bool status) => this.isWaitingForAPIFetch = status;

  @action
  void setIsWaitingAPISave(bool status) => this.isWaitingForAPISave = status;

  @action
  void setIsWaitingAPIDelete(bool status) => this.isWaitingForAPIDelete = status;

  @action
  void setProductTypeList(ProductType productType) => this.productTypeList = productType;

  @action
  void setProductTypeForm(ProductType productType) => this.productTypeForm = productType;

  @action
  void setImagePreview(String? imageUrl) => this.productImageURL = imageUrl;

  @action
  Future<void> reloadProducts() async {
    this.allProducts.clear();
    await this.fetchProducts();
  }

  @action
  Future<void> loadProducts() async {
    if (this.allProducts.isEmpty)
      await this.fetchProducts();
  }

  @action
  Future<void> fetchProducts() async {
    this.isWaitingForAPIFetch = true;
    this.allProducts.addAll(await this._productsRepository.getProducts());
    this.isWaitingForAPIFetch = false;
  }

  @action
  Future<bool> saveProduct(ProductModel product, {bool isUpdate = false}) async {
    this.isWaitingForAPISave = true;
    final bool isSuccess = await (isUpdate ? this._productsRepository.updateProduct(product) : this._productsRepository.createProduct(product));
    this.isWaitingForAPISave = false;
    return isSuccess;
  }

  @action
  Future<bool> deleteProduct(String idProduct) async {
    this.isWaitingForAPIDelete = true;
    final bool isDeleted = await this._productsRepository.deleteProduct(idProduct);
    this.isWaitingForAPIDelete = false;
    return isDeleted;
  }
}