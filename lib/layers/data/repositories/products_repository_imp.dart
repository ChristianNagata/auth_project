

import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource;
  ProductsRepositoryImp(this._productsDataSource);

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _productsDataSource.getAllProducts();
  }

}