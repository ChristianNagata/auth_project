

import 'package:auth_project/layers/data/datasources/get_all_products_datasource.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/get_all_products_repository.dart';

class GetAllProductsRepositoryImp implements GetAllProductsRepository {
  final GetAllProductsDataSource _getAllProductsDataSource;
  GetAllProductsRepositoryImp(this._getAllProductsDataSource);

  @override
  Stream<List<ProductEntity>> call() {
    return _getAllProductsDataSource.call();
  }

}