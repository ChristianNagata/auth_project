import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/data/dtos/product_dto.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsDataSourceFirestoreImp implements ProductsDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ProductsDataSourceFirestoreImp(
    this._firebaseFirestore,
  );

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _firebaseFirestore.collection('produtos').snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => ProductDto.fromMap(document.data()))
            .toList());
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _firebaseFirestore
        .collection('produtos')
        .doc(productId)
        .delete();
  }

  @override
  Future<void> saveProduct(ProductDto product) async {
    return await _firebaseFirestore
        .collection('produtos')
        .doc(product.id)
        .set(product.toMap());
  }

  @override
  Future<void> updateProduct(ProductDto product) async {
    return await _firebaseFirestore
        .collection('produtos')
        .doc(product.id)
        .update(product.toMap());
  }
}
