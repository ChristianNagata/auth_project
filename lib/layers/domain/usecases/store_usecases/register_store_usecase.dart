import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import 'package:uuid/uuid.dart';
import '../../entities/store_entity.dart';

class RegisterStoreUseCase {
  final StoreRepository _storeRepository;
  final GetCurrentUserUseCase _getCurrentUser;
  final Uuid _uuid;

  RegisterStoreUseCase(
    this._storeRepository,
    this._getCurrentUser,
    this._uuid,
  );

  Future<void> call({
    required String nome,
    required String categoria,
    required String cnpj,
    required String local,
  }) async {
    StoreEntity _storeEntity = StoreEntity(
      id: _uuid.v4(),
      uid: _getCurrentUser()!.uid,
      nome: nome,
      categoria: categoria,
      cnpj: cnpj,
      local: local,
    );
    return await _storeRepository.registerStore(_storeEntity);
  }
}
