class ProductModel {
  String id;
  String nome;
  double preco;
  int estoque;
  String cor;

  ProductModel({
    required this.id,
    required this.nome,
    required this.preco,
    required this.estoque,
    required this.cor,
  });

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'estoque': estoque,
      'cor': cor,
    };
  }

  factory ProductModel.fromFirestore(Map<String, dynamic> firestoreMap) {
    return ProductModel(
      id: firestoreMap['id'],
      nome: firestoreMap['nome'],
      preco: firestoreMap['preco'],
      estoque: firestoreMap['estoque'],
      cor: firestoreMap['cor'],
    );
  }


}
