import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/save_product%20_usecase.dart';

class SaveProductUseCaseImp implements SaveProductUseCase {
  final ProductsRepository _productsRepository;
  SaveProductUseCaseImp(this._productsRepository);

  @override
  Future<void> saveProduct(ProductEntity product) async {
    return await _productsRepository.saveProduct(product);
  }

}