import '../../../data/dtos/product_dto.dart';

abstract class SaveProductUseCase {
  Future<void> saveProduct(ProductDto product);
}
