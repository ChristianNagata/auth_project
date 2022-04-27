import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/register_store_usecase.dart';

class RegisterStoreUseCaseImp implements RegisterStoreUseCase {
  final StoreRepository _storeRepository;
  RegisterStoreUseCaseImp(this._storeRepository);

  @override
  Future<void> registerStore(StoreEntity storeEntity) async {
    return await _storeRepository.registerStore(storeEntity);
  }

}