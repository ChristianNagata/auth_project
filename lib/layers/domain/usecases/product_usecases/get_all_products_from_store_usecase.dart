import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecase.dart';
import '../../entities/product_entity.dart';
import '../../entities/store_entity.dart';

class GetAllProductsFromStoreUseCase {
  final ProductsRepository _productsRepository;
  final StoreUseCase _storeUseCase;

  GetAllProductsFromStoreUseCase(this._storeUseCase, this._productsRepository);

  Future<List<ProductEntity>> call() async {
    StoreEntity store = await _storeUseCase.getStoreInformation();
    String storeId = store.id;
    return await _productsRepository.getAllProductsFromStore(storeId);
  }
}
