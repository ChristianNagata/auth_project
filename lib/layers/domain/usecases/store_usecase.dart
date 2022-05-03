import 'package:auth_project/layers/domain/entities/store_entity.dart';

abstract class StoreUseCase {
  Future<void> registerStore(StoreEntity storeEntity);
  Stream<StoreEntity> getStoreInformation();
}