// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainController on MainControllerBase, Store {
  late final _$isWaitingForAPIFetchAtom =
      Atom(name: 'MainControllerBase.isWaitingForAPIFetch', context: context);

  @override
  bool get isWaitingForAPIFetch {
    _$isWaitingForAPIFetchAtom.reportRead();
    return super.isWaitingForAPIFetch;
  }

  @override
  set isWaitingForAPIFetch(bool value) {
    _$isWaitingForAPIFetchAtom.reportWrite(value, super.isWaitingForAPIFetch,
        () {
      super.isWaitingForAPIFetch = value;
    });
  }

  late final _$isWaitingForAPISaveAtom =
      Atom(name: 'MainControllerBase.isWaitingForAPISave', context: context);

  @override
  bool get isWaitingForAPISave {
    _$isWaitingForAPISaveAtom.reportRead();
    return super.isWaitingForAPISave;
  }

  @override
  set isWaitingForAPISave(bool value) {
    _$isWaitingForAPISaveAtom.reportWrite(value, super.isWaitingForAPISave, () {
      super.isWaitingForAPISave = value;
    });
  }

  late final _$isWaitingForAPIDeleteAtom =
      Atom(name: 'MainControllerBase.isWaitingForAPIDelete', context: context);

  @override
  bool get isWaitingForAPIDelete {
    _$isWaitingForAPIDeleteAtom.reportRead();
    return super.isWaitingForAPIDelete;
  }

  @override
  set isWaitingForAPIDelete(bool value) {
    _$isWaitingForAPIDeleteAtom.reportWrite(value, super.isWaitingForAPIDelete,
        () {
      super.isWaitingForAPIDelete = value;
    });
  }

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

  late final _$productTypeListAtom =
      Atom(name: 'MainControllerBase.productTypeList', context: context);

  @override
  ProductType get productTypeList {
    _$productTypeListAtom.reportRead();
    return super.productTypeList;
  }

  @override
  set productTypeList(ProductType value) {
    _$productTypeListAtom.reportWrite(value, super.productTypeList, () {
      super.productTypeList = value;
    });
  }

  late final _$productTypeFormAtom =
      Atom(name: 'MainControllerBase.productTypeForm', context: context);

  @override
  ProductType get productTypeForm {
    _$productTypeFormAtom.reportRead();
    return super.productTypeForm;
  }

  @override
  set productTypeForm(ProductType value) {
    _$productTypeFormAtom.reportWrite(value, super.productTypeForm, () {
      super.productTypeForm = value;
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

  late final _$productImageURLAtom =
      Atom(name: 'MainControllerBase.productImageURL', context: context);

  @override
  String? get productImageURL {
    _$productImageURLAtom.reportRead();
    return super.productImageURL;
  }

  @override
  set productImageURL(String? value) {
    _$productImageURLAtom.reportWrite(value, super.productImageURL, () {
      super.productImageURL = value;
    });
  }

  late final _$reloadProductsAsyncAction =
      AsyncAction('MainControllerBase.reloadProducts', context: context);

  @override
  Future<void> reloadProducts() {
    return _$reloadProductsAsyncAction.run(() => super.reloadProducts());
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('MainControllerBase.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  late final _$fetchProductsAsyncAction =
      AsyncAction('MainControllerBase.fetchProducts', context: context);

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  late final _$saveProductAsyncAction =
      AsyncAction('MainControllerBase.saveProduct', context: context);

  @override
  Future<bool> saveProduct(ProductModel product, {bool isUpdate = false}) {
    return _$saveProductAsyncAction
        .run(() => super.saveProduct(product, isUpdate: isUpdate));
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
  void clearForm() {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.clearForm');
    try {
      return super.clearForm();
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsWaitingAPIFetch(bool status) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setIsWaitingAPIFetch');
    try {
      return super.setIsWaitingAPIFetch(status);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsWaitingAPISave(bool status) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setIsWaitingAPISave');
    try {
      return super.setIsWaitingAPISave(status);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsWaitingAPIDelete(bool status) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setIsWaitingAPIDelete');
    try {
      return super.setIsWaitingAPIDelete(status);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductTypeList(ProductType productType) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setProductTypeList');
    try {
      return super.setProductTypeList(productType);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductTypeForm(ProductType productType) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setProductTypeForm');
    try {
      return super.setProductTypeForm(productType);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePreview(String? imageUrl) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.setImagePreview');
    try {
      return super.setImagePreview(imageUrl);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isWaitingForAPIFetch: ${isWaitingForAPIFetch},
isWaitingForAPISave: ${isWaitingForAPISave},
isWaitingForAPIDelete: ${isWaitingForAPIDelete},
allProducts: ${allProducts},
productTypeList: ${productTypeList},
productTypeForm: ${productTypeForm},
dateTime: ${dateTime},
productImageURL: ${productImageURL}
    ''';
  }
}
