import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/usecases/product_usecase.dart';

class ProductController {
  final ProductUseCase _productUseCase;

  ProductController(this._productUseCase);

  Stream<List<ProductEntity>> getAllProducts() {
    return _productUseCase.getAllProducts();
  }

  Future<void> deleteItem(String productId) async {
    return await _productUseCase.deleteItem(productId);
  }

  Future<void> saveProduct(ProductEntity product) async {
    return await _productUseCase.saveProduct(product);
  }

  Future<void> updateProduct(ProductEntity product) async {
    return await _productUseCase.updateProduct(product);
  }
}
