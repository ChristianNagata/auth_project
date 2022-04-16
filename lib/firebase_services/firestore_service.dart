
import 'package:auth_project/firebase_services/authentication_service.dart';
import 'package:auth_project/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth userProvider = Provider.;

  Future<void> saveProduct(ProductModel product) {
    return _db.collection('lojas').doc()
  }
}