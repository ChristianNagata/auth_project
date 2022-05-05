

import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class ProductUseCase {
  Future<void> saveProduct({
    required String nome,
    required double preco,
    required String cor,
    required String descricao,
    required int estoque,
  });
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteItem(String productId);
  Stream<List<ProductEntity>> getAllProducts();
  Stream<List<ProductEntity>> getAllProductsFromStore(String storeId);
}