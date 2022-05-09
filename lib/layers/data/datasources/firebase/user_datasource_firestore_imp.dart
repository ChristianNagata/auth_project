

import 'package:auth_project/layers/data/datasources/user_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataSourceFirestoreImp implements UserDataSource {
  final FirebaseFirestore _firebaseFirestore;
  
  UserDataSourceFirestoreImp(this._firebaseFirestore);


  @override
  Future<void> createUser(Map<String, dynamic> user) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(user['uid'])
        .set(user);
  }

  @override
  Future<Map<String, dynamic>> readUser(String userId) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(userId)
        .get()
        .then((data) => data.data()!);
  }

}