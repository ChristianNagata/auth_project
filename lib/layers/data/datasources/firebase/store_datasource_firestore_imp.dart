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
        .doc(storeDto.uid)
        .set(storeDto.toMap());
  }

  @override
  Future<StoreEntity> getStoreInformation() async {
    return await _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((data) => StoreDto.fromMap(data.data()!).toEntity());
  }
}
