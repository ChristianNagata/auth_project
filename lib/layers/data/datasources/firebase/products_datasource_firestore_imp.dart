import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsDataSourceFirestoreImp implements ProductsDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ProductsDataSourceFirestoreImp(
    this._firebaseFirestore,
  );

  @override
  Stream<List<Map<String, dynamic>>> getAllProducts() {
    return _firebaseFirestore
        .collection('produtos')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<List<Map<String, dynamic>>> getAllProductsFromStore(String storeId) async {
    return await _firebaseFirestore
        .collection('produtos')
        .where('storeId', isEqualTo: storeId)
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _firebaseFirestore
        .collection('produtos')
        .doc(productId)
        .delete();
  }

  @override
  Future<void> saveProduct(Map<String, dynamic> product) async {
    return await _firebaseFirestore
        .collection('produtos')
        .doc(product['id'])
        .set(product);
  }

  @override
  Future<void> updateProduct(Map<String, dynamic> product) async {
    return await _firebaseFirestore
        .collection('produtos')
        .doc(product['id'])
        .update(product);
  }
}
