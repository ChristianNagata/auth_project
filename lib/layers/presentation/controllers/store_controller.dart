import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/register_store_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreController {
  final RegisterStoreUseCase _registerStoreUseCase;
  final GetStoreInformationUseCase _getStoreInformationUseCase;

  StoreController(this._registerStoreUseCase, this._getStoreInformationUseCase);

  Future<void> registerStore(StoreDto store) async {
    return await _registerStoreUseCase.registerStore(store);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getStoreInformation() {
    return _getStoreInformationUseCase.getStoreInformation();
  }

}