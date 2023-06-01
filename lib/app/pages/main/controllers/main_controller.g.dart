// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainController on MainControllerBase, Store {
  late final _$allProductsAtom =
      Atom(name: 'MainControllerBase.allProducts', context: context);

  @override
  ObservableList<ProductModel> get allProducts {
    _$allProductsAtom.reportRead();
    return super.allProducts;
  }

  @override
  set allProducts(ObservableList<ProductModel> value) {
    _$allProductsAtom.reportWrite(value, super.allProducts, () {
      super.allProducts = value;
    });
  }

  late final _$productTypeSelectedAtom =
      Atom(name: 'MainControllerBase.productTypeSelected', context: context);

  @override
  ProductType get productTypeSelected {
    _$productTypeSelectedAtom.reportRead();
    return super.productTypeSelected;
  }

  @override
  set productTypeSelected(ProductType value) {
    _$productTypeSelectedAtom.reportWrite(value, super.productTypeSelected, () {
      super.productTypeSelected = value;
    });
  }

  late final _$dateTimeAtom =
      Atom(name: 'MainControllerBase.dateTime', context: context);

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  late final _$urlImageFormAtom =
      Atom(name: 'MainControllerBase.urlImageForm', context: context);

  @override
  String? get urlImageForm {
    _$urlImageFormAtom.reportRead();
    return super.urlImageForm;
  }

  @override
  set urlImageForm(String? value) {
    _$urlImageFormAtom.reportWrite(value, super.urlImageForm, () {
      super.urlImageForm = value;
    });
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('MainControllerBase.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  late final _$createProductAsyncAction =
      AsyncAction('MainControllerBase.createProduct', context: context);

  @override
  Future<bool> createProduct(ProductModel product) {
    return _$createProductAsyncAction.run(() => super.createProduct(product));
  }

  late final _$updateProductAsyncAction =
      AsyncAction('MainControllerBase.updateProduct', context: context);

  @override
  Future<bool> updateProduct(ProductModel product) {
    return _$updateProductAsyncAction.run(() => super.updateProduct(product));
  }

  late final _$deleteProductAsyncAction =
      AsyncAction('MainControllerBase.deleteProduct', context: context);

  @override
  Future<bool> deleteProduct(String idProduct) {
    return _$deleteProductAsyncAction.run(() => super.deleteProduct(idProduct));
  }

  late final _$MainControllerBaseActionController =
      ActionController(name: 'MainControllerBase', context: context);

  @override
  void initTimer() {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.initTimer');
    try {
      return super.initTimer();
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductType(ProductType productType) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setProductType');
    try {
      return super.setProductType(productType);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allProducts: ${allProducts},
productTypeSelected: ${productTypeSelected},
dateTime: ${dateTime},
urlImageForm: ${urlImageForm}
    ''';
  }
}
