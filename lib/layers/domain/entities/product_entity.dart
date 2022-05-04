class ProductEntity {
  String id;
  String storeId;
  String nome;
  double preco;
  int estoque;
  String cor;
  String descricao;

  ProductEntity({
    required this.id,
    required this.storeId,
    required this.nome,
    required this.preco,
    required this.estoque,
    required this.cor,
    required this.descricao,
  });
}
