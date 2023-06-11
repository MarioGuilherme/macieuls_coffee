import "dart:convert";
import "dart:developer";

import "package:dio/dio.dart";

import "package:macieuls_coffee/app/core/exceptions/repository_exception.dart";
import "package:macieuls_coffee/app/core/http/http_client.dart";
import "package:macieuls_coffee/app/core/http/http_method.dart";
import "package:macieuls_coffee/app/models/product_model.dart";
import "package:macieuls_coffee/app/repositories/products/products_repository.dart";

class ProductsRepositoryImpl implements ProductsRepository {
  final HttpClient httpClient;

  ProductsRepositoryImpl({ required this.httpClient });

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final Response result = await this.httpClient.restRequest("/produtos", HttpMethod.GET);

      if (result.data == null) return [];

      return List<ProductModel>.from(jsonDecode(result.data).map((x) => ProductModel.fromJson(x)));
    } on DioError catch (e, s) {
      log("Erro ao buscar os produtos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os produtos");
    }
  }

  @override
  Future<ProductModel> getProductById(String idProduct) async {
    try {
      final Response result = await this.httpClient.restRequest("/produto", HttpMethod.GET, { "idProduto": idProduct });
      return ProductModel.fromJson(result.data);
    } on DioError catch (e, s) {
      log("Erro ao buscar os produtos!", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os produtos!");
    }
  }

  @override
  Future<bool> createProduct(ProductModel product) async {
    try {
      final Response result = await this.httpClient.restRequest("/produto", HttpMethod.POST, product.toJson());
      return result.statusCode == 201;
    } on DioError catch (e, s) {
      log("Erro ao cadastrar produto!", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao cadastrar produto");
    }
  }

  @override
  Future<bool> updateProduct(ProductModel product) async {
    try {
      final Response result = await this.httpClient.restRequest("/produto", HttpMethod.PUT, {
        "idProduto": product.id,
        "produto": jsonEncode(product)
      });
      return result.statusCode == 204;
    } on DioError catch (e, s) {
      log("Erro ao atualizar produto!", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao atualizar produto");
    }
  }

  @override
  Future<bool> deleteProduct(String idProduct) async {
    try {
      final Response<dynamic> result = await this.httpClient.restRequest("/produto", HttpMethod.DELETE, { "idProduto": idProduct });
      return result.statusCode == 204;
    } on DioError catch (e, s) {
      log("Erro ao excluir o produto!", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao excluir o produto!");
    }
  }
}