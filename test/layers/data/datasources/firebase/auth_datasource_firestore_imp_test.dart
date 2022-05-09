import 'package:auth_project/layers/data/datasources/firebase/products_datasource_firestore_imp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  group('From a specific user', () {
    final ProductsDataSourceFirestoreImp _dataSourceFirestoreImp =
        ProductsDataSourceFirestoreImp(
      _firebaseFirestore,
    );
    test('get all products', () {
      _dataSourceFirestoreImp.getAllProducts();
    });
  });
}
