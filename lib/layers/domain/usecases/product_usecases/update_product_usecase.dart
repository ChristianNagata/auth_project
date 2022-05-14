import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../entities/product_entity.dart';

class UpdateProductUseCase extends UseCase<bool, Params> {
  final ProductsRepository _productsRepository;

  UpdateProductUseCase(this._productsRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _productsRepository.updateProduct(params.product);
  }
}

class Params extends Equatable {
  final ProductEntity product;

  const Params(this.product);

  @override
  List<Object?> get props => [product];
}
