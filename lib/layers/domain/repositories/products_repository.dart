import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<Failure, bool>> saveProduct(ProductEntity product);

  Future<Either<Failure, bool>> updateProduct(ProductEntity product);

  Future<Either<Failure, bool>> deleteItem(String productId);

  Future<Either<Failure, List<ProductEntity>>> getAllProductsFromStore(String storeId);
}