import 'package:auth_project/layers/domain/entities/store_entity.dart';

abstract class StoreRepository {
  Future<void> registerStore(StoreEntity storeEntity);
  Future<StoreEntity> getStoreInformation();
}
