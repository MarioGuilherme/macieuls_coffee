import "package:macieuls_coffee/app/models/product_model.dart";

abstract interface class ProductsRepository {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(String idProduct);
  Future<bool> createProduct(ProductModel product);
  Future<bool> updateProduct(ProductModel product);
  Future<bool> deleteProduct(String idProduct);
}