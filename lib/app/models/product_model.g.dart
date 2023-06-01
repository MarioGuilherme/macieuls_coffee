// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['idProduto'] as String?,
      name: json['nome'] as String,
      description: json['descricao'] as String,
      price: json['preco'] as String,
      type: $enumDecode(_$ProductTypeEnumMap, json['idCategoria']),
      imageURL: json['foto'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'idProduto': instance.id,
      'nome': instance.name,
      'descricao': instance.description,
      'preco': instance.price,
      'idCategoria': _$ProductTypeEnumMap[instance.type]!,
      'foto': instance.imageURL,
    };

const _$ProductTypeEnumMap = {
  ProductType.cake: '1',
  ProductType.coffee: '2',
};
