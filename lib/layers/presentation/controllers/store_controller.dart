import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/store_usecase.dart';

class StoreController {
  final StoreUseCase _storeUseCase;

  StoreController(this._storeUseCase);

  Future<void> registerStore(StoreDto store) async {
    return await _storeUseCase.registerStore(store);
  }
}