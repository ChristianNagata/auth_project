

import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import '../dtos/product_dto.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource;
  ProductsRepositoryImp(this._productsDataSource);

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _productsDataSource.getAllProducts();
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _productsDataSource.deleteItem(productId);
  }

  @override
  Future<void> saveProduct(ProductDto product) async {
    return await _productsDataSource.saveProduct(product);
  }

  @override
  Future<void> updateProduct(ProductDto product) async {
    return await _productsDataSource.updateProduct(product);
  }

}