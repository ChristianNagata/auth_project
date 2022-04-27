import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/register_store_usecase.dart';

class StoreController {
  final RegisterStoreUseCase _registerStoreUseCase;
  final GetStoreInformationUseCase _getStoreInformationUseCase;

  StoreController(this._registerStoreUseCase, this._getStoreInformationUseCase);

  Future<void> registerStore(StoreEntity storeEntity) async {
    return await _registerStoreUseCase.registerStore(storeEntity);
  }

  Stream<StoreEntity> getStoreInformation() {
    return _getStoreInformationUseCase.getStoreInformation();
  }
}
