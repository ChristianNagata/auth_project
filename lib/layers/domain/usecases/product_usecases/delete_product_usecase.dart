import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteProductUseCase extends UseCase<bool, Params> {
  final ProductsRepository _productsRepository;

  DeleteProductUseCase(this._productsRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _productsRepository.deleteItem(params.productId);
  }
}

class Params extends Equatable {
  final String productId;
  const Params(this.productId);

  @override
  List<Object?> get props => [productId];
}