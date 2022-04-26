import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<void> saveProduct(ProductEntity product);

  Future<void> updateProduct(ProductEntity product);

  Future<void> deleteItem(String productId);

  Stream<List<ProductEntity>> getAllProducts();
}