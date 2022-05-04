import 'package:auth_project/layers/domain/entities/store_entity.dart';

abstract class StoreUseCase {
  Future<void> registerStore({
    required String nome,
    required String categoria,
    required String cnpj,
    required String local,
  });
  Future<StoreEntity> getStoreInformation();
}