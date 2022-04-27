import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';

class GetStoreInformationUseCaseImp implements GetStoreInformationUseCase {
  final StoreRepository _storeRepository;

  GetStoreInformationUseCaseImp(this._storeRepository);

  @override
  Stream<StoreEntity> getStoreInformation() {
    return _storeRepository.getStoreInformation();
  }
}
