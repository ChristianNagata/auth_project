import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../entities/product_entity.dart';
import '../../entities/store_entity.dart';

class GetAllProductsFromStoreUseCase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepository _productsRepository;
  final GetStoreInformationUseCase _getStoreInformationUseCase;

  GetAllProductsFromStoreUseCase(this._getStoreInformationUseCase, this._productsRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    StoreEntity store = await _getStoreInformationUseCase();
    String storeId = store.id;
    return await _productsRepository.getAllProductsFromStore(storeId);
  }
}
