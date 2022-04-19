import 'package:auth_project/models/product_model.dart';

abstract class IProductRepository {
  Future<void> saveProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Stream<List<ProductModel>> readProducts();
  Future<void> removeItem(String productId);
}