import 'package:auth_project/layers/data/datasources/store_datasource.dart';
import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreDataSourceFirestoreImp implements StoreDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  StoreDataSourceFirestoreImp(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<void> registerStore(StoreDto storeDto) async {
    return await _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(storeDto.toMap());
  }

  @override
  Stream<StoreEntity> getStoreInformation() {
    return _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((snapshot) => StoreDto.fromMap(snapshot.data()!).toEntity());
  }
}
