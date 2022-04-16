class StoreModel {
  String nome, categoria, cnpj, local;

  StoreModel({
    required this.cnpj, // id
    required this.nome,
    required this.categoria,
    required this.local,
  });

  Map<String, dynamic> createMap() {
    return {
      'nome': nome,
      'categoria': categoria,
      'cnpj': cnpj,
      'local': local,
    };
  }

  factory StoreModel.fromFirestore(Map<String, dynamic> firestoreMap) {
    return StoreModel(
      nome: firestoreMap['nome'],
      categoria: firestoreMap['categoria'],
      cnpj: firestoreMap['cnpj'],
      local: firestoreMap['local'],
    );
  }
}
