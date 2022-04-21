
import 'package:auth_project/layers/domain/entities/product_entity.dart';

abstract class GetAllProductsUseCase {
  Stream<List<ProductEntity>> call(); // all products
}