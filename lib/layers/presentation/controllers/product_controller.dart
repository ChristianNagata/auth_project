import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/delete_item_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/get_all_products_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/save_product%20_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/update_product_usecase.dart';

class ProductController {
  final GetAllProductsUseCase _getAllProductsUseCase;
  final DeleteItemUseCase _deleteItemUseCase;
  final SaveProductUseCase _saveProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  ProductController(this._getAllProductsUseCase,
      this._deleteItemUseCase,
      this._saveProductUseCase,
      this._updateProductUseCase,);

  Stream<List<ProductEntity>> getAllProducts() {
    return _getAllProductsUseCase.getAllProducts();
  }

  Future<void> deleteItem(String productId) async {
    return await _deleteItemUseCase.deleteItem(productId);
  }

  Future<void> saveProduct(ProductEntity product) async {
    return await _saveProductUseCase.saveProduct(product);
  }

  Future<void> updateProduct(ProductEntity product) async {
    return await _updateProductUseCase.updateProduct(product);
  }

}