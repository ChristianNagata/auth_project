import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';
import '../../entities/product_entity.dart';

class UpdateProductUseCase extends UseCase {
  final ProductsRepository _productsRepository;

  UpdateProductUseCase(this._productsRepository);

  Future<Either<Failure, bool>> call(ProductEntity product) async {
    return await _productsRepository.updateProduct(product);
  }
}
