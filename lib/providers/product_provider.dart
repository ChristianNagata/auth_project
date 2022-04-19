import 'package:auth_project/firebase_services/authentication_service.dart';
import 'package:auth_project/models/product_model.dart';
import 'package:auth_project/repositories/product.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import '../db/db_firestore.dart';

class ProductProvider with ChangeNotifier {
  late AuthenticationService auth;
  //final service = ProductRepository(auth: auth);
  var uuid = const Uuid();

  late String _id;
  late String _nome;
  late double _preco;
  late int _estoque;
  late String _cor;
  late String _descricao;

  // getters
  String get getNome => _nome;

  double get getPreco => _preco;

  int get getEstoque => _estoque;

  String get getCor => _cor;

  String get getDescricao => _descricao;

  // setters

  void changeAll(
    String nome,
    double preco,
    int estoque,
    String cor,
    String descricao,
  ) {
    _nome = nome;
    _preco = preco;
    _estoque = estoque;
    _cor = cor;
    _descricao = descricao;
    notifyListeners();
  }

  void changeNome(String val) {
    _nome = val;
    notifyListeners();
  }

  void changePreco(String val) {
    _preco = double.parse(val);
    notifyListeners();
  }

  void changeEstoque(String val) {
    _estoque = int.parse(val);
    notifyListeners();
  }

  void changeCor(String val) {
    _cor = val;
    notifyListeners();
  }

  void changeDescricao(String val) {
    _descricao = val;
    notifyListeners();
  }

  void saveData() {
    var saveProduct = ProductModel(
      id: uuid.v4(),
      nome: getNome,
      preco: getPreco,
      estoque: getEstoque,
      cor: getCor,
      descricao: getDescricao,
    );
    // service.saveProduct(saveProduct);
    notifyListeners();
  }

  void updateData() {
    var updateProduct = ProductModel(
      id: _id,
      nome: _nome,
      preco: _preco,
      estoque: _estoque,
      cor: _cor,
      descricao: _descricao,
    );
    // service.updateProduct(updateProduct);
    notifyListeners();
  }

  void removeData() {
    // service.removeItem(_id);
    notifyListeners();
  }
}
