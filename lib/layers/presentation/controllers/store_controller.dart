import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/usecases/store_usecase.dart';

class StoreController {
  final StoreUseCase _storeUseCase;

  StoreController(this._storeUseCase);

  Future<StoreEntity> getStoreInformation() async {
    return await _storeUseCase.getStoreInformation();
  }

  Future<void> registerStore({
    required String nome,
    required String categoria,
    required String cnpj,
    required String local,
  }) async {
    return await _storeUseCase.registerStore(
      nome: nome,
      categoria: categoria,
      cnpj: cnpj,
      local: local,
    );
  }
}
