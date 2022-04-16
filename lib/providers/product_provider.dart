
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {

  late String _nome;
  late double _preco;
  late int _estoque;
  late String _cor;

  // getters
  String get getNome => _nome;
  double get getPreco => _preco;
  int get getEstoque => _estoque;
  String get getCor => _cor;

  // setters
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
}