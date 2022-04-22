

import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/get_all_products_usecase.dart';

class ProductController {
  final GetAllProductsUseCase _getAllProductsUseCase;

  ProductController(this._getAllProductsUseCase);

  late ProductEntity product;

  getAllProducts() {
    return _getAllProductsUseCase.getAllProducts();
  }
}