
import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class GetAllProductsUseCase {
  Stream<List<ProductEntity>> getAllProducts(); // all products
}