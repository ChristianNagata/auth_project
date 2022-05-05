import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/usecases/product_usecase.dart';
import 'package:auth_project/layers/presentation/controllers/store_controller.dart';

class ProductController {
  final ProductUseCase _productUseCase;

  ProductController(this._productUseCase);

  Stream<List<ProductEntity>> getAllProducts() {
    return _productUseCase.getAllProducts();
  }

  Stream<List<ProductEntity>> getAllProductsFromStore(String storeId) {
    return _productUseCase.getAllProductsFromStore(storeId);
  }

  Future<void> deleteItem(String productId) async {
    return await _productUseCase.deleteItem(productId);
  }

  Future<void> saveProduct({
    required String nome,
    required double preco,
    required String cor,
    required String descricao,
    required int estoque,
  }) async {
    return await _productUseCase.saveProduct(
      nome: nome,
      preco: preco,
      cor: cor,
      descricao: descricao,
      estoque: estoque,
    );
  }

  Future<void> updateProduct(ProductEntity product) async {
    return await _productUseCase.updateProduct(product);
  }
}
