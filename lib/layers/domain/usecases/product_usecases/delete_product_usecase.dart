import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteProductUseCase extends UseCase {
  final ProductsRepository _productsRepository;

  DeleteProductUseCase(this._productsRepository);

  Future<Either<Failure, bool>> call(String productId) async {
    return await _productsRepository.deleteItem(productId);
  }
}
