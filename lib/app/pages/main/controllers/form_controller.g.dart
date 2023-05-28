// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormController on FormControllerBase, Store {
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
  ProductType? get productType {
    _$productTypeAtom.reportRead();
    return super.productType;
  }

  @override
  set productType(ProductType? value) {
    _$productTypeAtom.reportWrite(value, super.productType, () {
      super.productType = value;
    });
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  void setImagePreview(String? imageUrl) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.setImagePreview');
    try {
      return super.setImagePreview(imageUrl);
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
  void clear() {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productImageURL: ${productImageURL},
productType: ${productType}
    ''';
  }
}
