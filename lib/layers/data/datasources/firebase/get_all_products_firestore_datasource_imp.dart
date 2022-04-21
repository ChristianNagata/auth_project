import 'package:auth_project/layers/data/datasources/get_all_products_datasource.dart';
import 'package:auth_project/layers/data/dtos/product_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetAllProductsFirestoreDataSourceImp implements GetAllProductsDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  GetAllProductsFirestoreDataSourceImp({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Stream<List<ProductDto>> call() {
    var products = firebaseFirestore
        .collection('lojas')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('produtos')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((document) => ProductDto.fromMap(document.data()))
        .toList());
    return products;
  }
}
