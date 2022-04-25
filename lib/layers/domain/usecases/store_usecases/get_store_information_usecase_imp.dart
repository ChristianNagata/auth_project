
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetStoreInformationUseCaseImp implements GetStoreInformationUseCase {
  final StoreRepository _storeRepository;
  GetStoreInformationUseCaseImp(this._storeRepository);

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getStoreInformation() {
    return _storeRepository.getStoreInformation();
  }

}