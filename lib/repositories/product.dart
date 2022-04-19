

import 'package:auth_project/db/db_firestore.dart';
import 'package:auth_project/firebase_services/authentication_service.dart';
import 'package:auth_project/models/product_model.dart';
import 'package:auth_project/repositories/product_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductRepository implements IProductRepository {

  late FirebaseFirestore db;
  late AuthenticationService auth;
  var uuid = const Uuid();


  ProductRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  // @override
  // Future<void> createStore(StoreModel store) {
  //   return db
  //       .collection('lojas')
  //       .doc(auth.user!.uid)
  //       .set(store.createMap());
  // }

  @override
  Future<void> saveProduct(ProductModel product) {
    return db
        .collection('lojas')
        .doc(auth.user!.uid)
        .collection('produtos')
        .doc(product.id)
        .set(product.createMap());
  }
  @override
  Future<void> updateProduct(ProductModel product) {
    return db
        .collection('lojas')
        .doc(auth.user!.uid)
        .collection('produtos')
        .doc(product.id)
        .update(product.createMap());
  }
  @override
  Stream<List<ProductModel>> readProducts() {
    return db
        .collection('lojas')
        .doc(auth.user!.uid)
        .collection('produtos')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((document) => ProductModel.fromFirestore(document.data()))
        .toList());
  }
  @override
  Future<void> removeItem(String productId) {
    return db
        .collection('lojas')
        .doc(auth.user!.uid)
        .collection('produtos')
        .doc(productId)
        .delete();
  }

}