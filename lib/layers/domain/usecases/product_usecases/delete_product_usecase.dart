import 'package:auth_project/layers/domain/repositories/products_repository.dart';

class DeleteProductUseCase {
  final ProductsRepository _productsRepository;

  DeleteProductUseCase(this._productsRepository);

  Future<void> call(String productId) async {
    return await _productsRepository.deleteItem(productId);
  }
}
