

import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class GetAllProductsRepository {
  Stream<List<ProductEntity>> call();
}