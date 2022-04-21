
import 'package:auth_project/layers/data/dtos/product_dto.dart';

abstract class GetAllProductsDataSource {
  Stream<List<ProductDto>> call();
}