import 'package:flutter/material.dart';

class StoreProvider with ChangeNotifier {
  late String _cnpj, _nome, _categoria, _local;

  // getters
  String get getCNPJ => _cnpj;

  String get getNome => _nome;

  String get getCategoria => _categoria;

  String get getLocal => _local;

  // setters]
  void changeCNPJ(String val) {
    _cnpj = val;
    notifyListeners();
  }

  void changeNome(String val) {
    _nome = val;
    notifyListeners();
  }

  void changeCategoria(String val) {
    _categoria = val;
    notifyListeners();
  }

  void changeLocal(String val) {
    _local = val;
    notifyListeners();
  }
}
