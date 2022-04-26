import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/update_product_usecase.dart';

class UpdateProductUseCaseImp implements UpdateProductUseCase {
  final ProductsRepository _productsRepository;
  UpdateProductUseCaseImp(this._productsRepository);

  @override
  Future<void> updateProduct(ProductEntity product) async {
    return await _productsRepository.updateProduct(product);
  }
}