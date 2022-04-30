import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/usecases/store_usecase/store_usecase.dart';

class StoreController {
  final StoreUseCase _storeUseCase;

  StoreController(this._storeUseCase);

  Stream<StoreEntity> getStoreInformation() {
    return _storeUseCase.getStoreInformation();
  }

  Future<void> registerStore(StoreEntity storeEntity) async {
    return await _storeUseCase.registerStore(storeEntity);
  }
}
