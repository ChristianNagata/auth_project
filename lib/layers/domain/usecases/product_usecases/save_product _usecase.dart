import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class SaveProductUseCase {
  Future<void> saveProduct(ProductEntity product);
}
