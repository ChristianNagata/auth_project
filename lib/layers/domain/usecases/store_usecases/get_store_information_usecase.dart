import 'package:auth_project/layers/domain/entities/store_entity.dart';

abstract class GetStoreInformationUseCase {
  Stream<StoreEntity> getStoreInformation();
}
