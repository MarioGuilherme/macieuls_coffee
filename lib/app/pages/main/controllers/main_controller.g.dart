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

  late final _$productTypeSelectedListAtom = Atom(
      name: 'MainControllerBase.productTypeSelectedList', context: context);

  @override
  ProductType get productTypeSelectedList {
    _$productTypeSelectedListAtom.reportRead();
    return super.productTypeSelectedList;
  }

  @override
  set productTypeSelectedList(ProductType value) {
    _$productTypeSelectedListAtom
        .reportWrite(value, super.productTypeSelectedList, () {
      super.productTypeSelectedList = value;
    });
  }

  late final _$productTypeSelectedFormAtom = Atom(
      name: 'MainControllerBase.productTypeSelectedForm', context: context);

  @override
  ProductType get productTypeSelectedForm {
    _$productTypeSelectedFormAtom.reportRead();
    return super.productTypeSelectedForm;
  }

  @override
  set productTypeSelectedForm(ProductType value) {
    _$productTypeSelectedFormAtom
        .reportWrite(value, super.productTypeSelectedForm, () {
      super.productTypeSelectedForm = value;
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
  void toggleProductTypeList(ProductType productType) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.toggleProductTypeList');
    try {
      return super.toggleProductTypeList(productType);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleProductTypeForm(ProductType productType) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.toggleProductTypeForm');
    try {
      return super.toggleProductTypeForm(productType);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteProduct(ProductModel product) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.deleteProduct');
    try {
      return super.deleteProduct(product);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allProducts: ${allProducts},
productTypeSelectedList: ${productTypeSelectedList},
productTypeSelectedForm: ${productTypeSelectedForm},
dateTime: ${dateTime}
    ''';
  }
}
