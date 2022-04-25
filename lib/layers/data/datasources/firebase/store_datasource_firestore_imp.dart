import 'package:auth_project/layers/data/datasources/store_datasource.dart';
import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreDataSourceFirestoreImp implements StoreDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  StoreDataSourceFirestoreImp(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<void> registerStore(StoreDto store) async {
    return await _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(store.toMap());
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getStoreInformation() {
    return _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots();
  }
}
