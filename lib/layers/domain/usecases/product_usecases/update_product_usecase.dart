import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import '../../entities/product_entity.dart';

class UpdateProductUseCase {
  final ProductsRepository _productsRepository;

  UpdateProductUseCase(this._productsRepository);

  Future<void> call(ProductEntity product) async {
    return await _productsRepository.updateProduct(product);
  }
}
