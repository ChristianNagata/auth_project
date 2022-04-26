
import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class UpdateProductUseCase {
  Future<void> updateProduct(ProductEntity product);
}