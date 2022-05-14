import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import '../../entities/product_entity.dart';

class GetAllProductsUseCase {
  final ProductsRepository _productsRepository;

  GetAllProductsUseCase(this._productsRepository);

  Stream<List<ProductEntity>> call() {
    return _productsRepository.getAllProducts();
  }
}
