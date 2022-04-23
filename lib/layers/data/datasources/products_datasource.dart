import 'package:auth_project/layers/data/dtos/product_dto.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class ProductsDataSource {
  Future<void> saveProduct(ProductDto product);

  Future<void> updateProduct(ProductDto product);

  Future<void> deleteItem(String productId);

  Stream<List<ProductEntity>> getAllProducts();
}
