class StoreModel {
  String id, nome, categoria, cnpj, local;

  StoreModel({
    required this.id, // == user id
    required this.cnpj,
    required this.nome,
    required this.categoria,
    required this.local,
  });

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'nome': nome,
      'categoria': categoria,
      'cnpj': cnpj,
      'local': local,
    };
  }

  factory StoreModel.fromFirestore(Map<String, dynamic> firestoreMap) {
    return StoreModel(
      id: firestoreMap['id'],
      nome: firestoreMap['nome'],
      categoria: firestoreMap['categoria'],
      cnpj: firestoreMap['cnpj'],
      local: firestoreMap['local'],
    );
  }
}
