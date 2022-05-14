import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import '../../entities/store_entity.dart';

class GetStoreInformationUseCase {
  final StoreRepository _storeRepository;

  GetStoreInformationUseCase(this._storeRepository);

  Future<StoreEntity> call() async {
    return await _storeRepository.getStoreInformation();
  }
}
