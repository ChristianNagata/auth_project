import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecase.dart';
import 'package:auth_project/layers/domain/usecases/store_usecase.dart';
import 'package:uuid/uuid.dart';

class StoreUseCaseImp implements StoreUseCase {
  final Uuid _uuid = const Uuid();
  final StoreRepository _storeRepository;
  final AuthUseCase _authUseCase;

  StoreUseCaseImp(this._storeRepository, this._authUseCase);

  @override
  Future<StoreEntity> getStoreInformation() async {
    return await _storeRepository.getStoreInformation();
  }

  @override
  Future<void> registerStore({
    required String nome,
    required String categoria,
    required String cnpj,
    required String local,
  }) async {
    StoreEntity _storeEntity = StoreEntity(
      id: _uuid.v4(),
      uid: _authUseCase.getCurrentUser()!.uid,
      nome: nome,
      categoria: categoria,
      cnpj: cnpj,
      local: local,
    );
    return await _storeRepository.registerStore(_storeEntity);
  }
}
