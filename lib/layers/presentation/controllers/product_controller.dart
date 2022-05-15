import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/delete_product_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/get_all_products_from_store_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/save_product_usecasse.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/update_product_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';

class ProductController {
  final GetAllProductsFromStoreUseCase _getAllProductsFromStoreUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final SaveProductUseCase _saveProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  ProductController(
    this._getAllProductsFromStoreUseCase,
    this._updateProductUseCase,
    this._saveProductUseCase,
    this._deleteProductUseCase,
  );

  Future<Either<Failure, List<ProductEntity>>> getAllProductsFromStore() async {
    return await _getAllProductsFromStoreUseCase();
  }

  Future<Either<Failure, bool>> deleteItem(String productId) async {
    return await _deleteProductUseCase(productId);
  }

  Future<Either<Failure, bool>> saveProduct({
    required String nome,
    required double preco,
    required String cor,
    required String descricao,
    required int estoque,
  }) async {
    return await _saveProductUseCase(
      nome: nome,
      preco: preco,
      cor: cor,
      descricao: descricao,
      estoque: estoque,
    );
  }

  Future<Either<Failure, bool>> updateProduct(ProductEntity product) async {
    return await _updateProductUseCase(product);
  }
}
