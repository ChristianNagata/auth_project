import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class StoreRepository {
  Future<void> registerStore(StoreDto store);
  Stream<DocumentSnapshot<Map<String, dynamic>>> getStoreInformation();
}
