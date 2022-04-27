import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/domain/entities/store_entity.dart';

abstract class StoreDataSource {
  Future<void> registerStore(StoreDto store);
  Stream<StoreEntity> getStoreInformation();
}
