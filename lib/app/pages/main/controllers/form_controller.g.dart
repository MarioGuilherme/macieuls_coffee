// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormController on FormControllerBase, Store {
  late final _$productNameAtom =
      Atom(name: 'FormControllerBase.productName', context: context);

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  late final _$productDescriptionAtom =
      Atom(name: 'FormControllerBase.productDescription', context: context);

  @override
  String get productDescription {
    _$productDescriptionAtom.reportRead();
    return super.productDescription;
  }

  @override
  set productDescription(String value) {
    _$productDescriptionAtom.reportWrite(value, super.productDescription, () {
      super.productDescription = value;
    });
  }

  late final _$productPriceAtom =
      Atom(name: 'FormControllerBase.productPrice', context: context);

  @override
  String get productPrice {
    _$productPriceAtom.reportRead();
    return super.productPrice;
  }

  @override
  set productPrice(String value) {
    _$productPriceAtom.reportWrite(value, super.productPrice, () {
      super.productPrice = value;
    });
  }

  late final _$productImageURLAtom =
      Atom(name: 'FormControllerBase.productImageURL', context: context);

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

  late final _$productTypeAtom =
      Atom(name: 'FormControllerBase.productType', context: context);

  @override
  ProductType get productType {
    _$productTypeAtom.reportRead();
    return super.productType;
  }

  @override
  set productType(ProductType value) {
    _$productTypeAtom.reportWrite(value, super.productType, () {
      super.productType = value;
    });
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  void setName(String name) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String price) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageUrl(String? imageUrl) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setImageUrl');
    try {
      return super.setImageUrl(imageUrl);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductType(ProductType productType) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setProductType');
    try {
      return super.setProductType(productType);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearForm() {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.clearForm');
    try {
      return super.clearForm();
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productName: ${productName},
productDescription: ${productDescription},
productPrice: ${productPrice},
productImageURL: ${productImageURL},
productType: ${productType}
    ''';
  }
}
