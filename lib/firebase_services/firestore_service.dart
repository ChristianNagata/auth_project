import 'package:auth_project/models/product_model.dart';
import 'package:auth_project/models/store_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  Future<void> createStore(StoreModel store) {
    return _db
        .collection('lojas')
        .doc(_user!.uid)
        .set(store.createMap());
  }

  Future<void> saveProduct(ProductModel product) {
    return _db
        .collection('lojas')
        .doc(_user!.uid)
        .collection('produtos')
        .doc(product.id)
        .set(product.createMap());
  }

  Future<void> updateProduct(ProductModel product) {
    return _db
        .collection('lojas')
        .doc(_user!.uid)
        .collection('produtos')
        .doc(product.id)
        .update(product.createMap());
  }

  Stream<List<ProductModel>> getProducts(User user) {
    return _db
        .collection('lojas')
        .doc(user.uid)
        .collection('produtos')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => ProductModel.fromFirestore(document.data()))
            .toList());
  }

  Future<void> removeItem(String productId) {
    return _db
        .collection('lojas')
        .doc(_user!.uid)
        .collection('produtos')
        .doc(productId)
        .delete();
  }
}
