import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/product_usecase/product_usecase.dart';

class ProductUseCaseImp implements ProductUseCase {
  final ProductsRepository _productsRepository;

  ProductUseCaseImp(this._productsRepository);

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _productsRepository.getAllProducts();
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _productsRepository.deleteItem(productId);
  }

  @override
  Future<void> saveProduct(ProductEntity product) async {
    return await _productsRepository.saveProduct(product);
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    return await _productsRepository.updateProduct(product);
  }
}
