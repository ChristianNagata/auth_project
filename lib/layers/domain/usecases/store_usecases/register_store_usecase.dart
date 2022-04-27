import 'package:auth_project/layers/domain/entities/store_entity.dart';

abstract class RegisterStoreUseCase {
  Future<void> registerStore(StoreEntity storeEntity);
}