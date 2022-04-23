

import 'package:auth_project/layers/data/dtos/product_dto.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/save_product%20_usecase.dart';

class SaveProductUseCaseImp implements SaveProductUseCase {
  final ProductsRepository _productsRepository;
  SaveProductUseCaseImp(this._productsRepository);

  @override
  Future<void> saveProduct(ProductDto product) async {
    return await _productsRepository.saveProduct(product);
  }

}