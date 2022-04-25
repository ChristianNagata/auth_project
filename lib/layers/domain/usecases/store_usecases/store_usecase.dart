import 'package:auth_project/layers/data/dtos/store_dto.dart';

abstract class StoreUseCase {
  Future<void> registerStore(StoreDto store);
}