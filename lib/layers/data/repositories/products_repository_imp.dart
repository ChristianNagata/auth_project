import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import '../dtos/product_dto.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource;

  ProductsRepositoryImp(this._productsDataSource);

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _productsDataSource.getAllProducts().map((products) => products
        .map((product) => ProductDto.fromMap(product).toEntity())
        .toList());
  }

  @override
  Future<List<ProductEntity>> getAllProductsFromStore(String storeId) async {
    return await _productsDataSource.getAllProductsFromStore(storeId).then(
        (products) => products
            .map((product) => ProductDto.fromMap(product).toEntity())
            .toList());
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _productsDataSource.deleteItem(productId);
  }

  @override
  Future<void> saveProduct(ProductEntity productEntity) async {
    ProductDto productDto = ProductDto.fromEntity(productEntity);
    Map<String, dynamic> productMap = productDto.toMap();
    return await _productsDataSource.saveProduct(productMap);
  }

  @override
  Future<void> updateProduct(ProductEntity productEntity) async {
    ProductDto productDto = ProductDto.fromEntity(productEntity);
    Map<String, dynamic> productMap = productDto.toMap();
    return await _productsDataSource.updateProduct(productMap);
  }
}
