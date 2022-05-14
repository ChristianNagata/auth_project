import 'package:auth_project/core/error/exceptions.dart';
import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';
import '../dtos/product_dto.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource;

  ProductsRepositoryImp(this._productsDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProductsFromStore(
      String storeId) async {
    try {
      List<ProductEntity> products = await _productsDataSource
          .getAllProductsFromStore(storeId)
          .then((products) =>
          products
              .map((product) => ProductDto.fromMap(product).toEntity())
              .toList());
      return Right(products);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteItem(String productId) async {
    try {
      bool response = await _productsDataSource.deleteItem(productId);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveProduct(ProductEntity productEntity) async {
    try {
      ProductDto productDto = ProductDto.fromEntity(productEntity);
      Map<String, dynamic> productMap = productDto.toMap();
      bool response = await _productsDataSource.saveProduct(productMap);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateProduct(
      ProductEntity productEntity) async {
    try {
      ProductDto productDto = ProductDto.fromEntity(productEntity);
      Map<String, dynamic> productMap = productDto.toMap();
      bool response = await _productsDataSource.updateProduct(productMap);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
