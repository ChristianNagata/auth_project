import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/get_all_products_usecase.dart';

class GetAllProductsUseCaseImp implements GetAllProductsUseCase {
  final ProductsRepository _productsRepository;
  GetAllProductsUseCaseImp(this._productsRepository);

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _productsRepository.getAllProducts();
  }
}