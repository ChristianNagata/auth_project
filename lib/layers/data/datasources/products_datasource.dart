
import 'package:auth_project/layers/data/dtos/product_dto.dart';

abstract class ProductsDataSource {
  Stream<List<ProductDto>> getAllProducts();
}