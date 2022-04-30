import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecase/store_usecase.dart';

class StoreUseCaseImp implements StoreUseCase {
  final StoreRepository _storeRepository;

  StoreUseCaseImp(this._storeRepository);

  @override
  Stream<StoreEntity> getStoreInformation() {
    return _storeRepository.getStoreInformation();
  }

  @override
  Future<void> registerStore(StoreEntity storeEntity) async {
    return await _storeRepository.registerStore(storeEntity);
  }
}
