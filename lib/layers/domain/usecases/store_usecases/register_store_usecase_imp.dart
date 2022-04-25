
import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/store_usecase.dart';

class RegisterStoreUseCaseImp implements StoreUseCase {
  final StoreRepository _storeRepository;
  RegisterStoreUseCaseImp(this._storeRepository);

  @override
  Future<void> registerStore(StoreDto store) async {
    return await _storeRepository.registerStore(store);
  }

}