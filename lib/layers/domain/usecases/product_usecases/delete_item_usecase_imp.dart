

import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/delete_item_usecase.dart';

class DeleteItemUseCaseImp implements DeleteItemUseCase {
  final ProductsRepository _productsRepository;
  DeleteItemUseCaseImp(this._productsRepository);

  @override
  Future<void> deleteItem(String productId) async {
    return await _productsRepository.deleteItem(productId);
  }
}