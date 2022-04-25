

import 'package:auth_project/layers/data/datasources/store_datasource.dart';
import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';

class StoreRepositoryImp implements StoreRepository {
  final StoreDataSource _storeDataSource;
  StoreRepositoryImp(this._storeDataSource);

  @override
  Future<void> registerStore(StoreDto store) async {
    return await _storeDataSource.registerStore(store);
  }

}