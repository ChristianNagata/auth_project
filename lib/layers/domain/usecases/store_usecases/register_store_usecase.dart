import 'package:auth_project/layers/data/dtos/store_dto.dart';

abstract class RegisterStoreUseCase {
  Future<void> registerStore(StoreDto store);
}