import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/data/dtos/product_dto.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductsDataSourceFirestoreImp implements ProductsDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  ProductsDataSourceFirestoreImp(
    this._firebaseFirestore,
    this._firebaseAuth,
  );

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('produtos')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => ProductDto.fromMap(document.data()))
            .toList());
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('produtos')
        .doc(productId)
        .delete();
  }

  @override
  Future<void> saveProduct(ProductDto product) async {
    return await _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('produtos')
        .doc(product.id)
        .set(product.toMap());
  }

  @override
  Future<void> updateProduct(ProductDto product) async {
    return await _firebaseFirestore
        .collection('lojas')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('produtos')
        .doc(product.id)
        .update(product.toMap());
  }
}
