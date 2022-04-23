import 'package:auth_project/layers/domain/entities/product_entity.dart';

import '../../data/dtos/product_dto.dart';

abstract class ProductsRepository {
  Future<void> saveProduct(ProductDto product);

  Future<void> updateProduct(ProductDto product);

  Future<void> deleteItem(String productId);

  Stream<List<ProductEntity>> getAllProducts();
}