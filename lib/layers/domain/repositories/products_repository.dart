

import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Stream<List<ProductEntity>> getAllProducts();
}