
import '../../../data/dtos/product_dto.dart';

abstract class UpdateProductUseCase {
  Future<void> updateProduct(ProductDto product);
}