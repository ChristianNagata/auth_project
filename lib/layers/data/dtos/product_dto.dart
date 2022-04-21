import 'package:auth_project/layers/domain/entities/product_entity.dart';

class ProductDto extends ProductEntity {
  ProductDto({
    required String id,
    required String nome,
    required double preco,
    required int estoque,
    required String cor,
    required String descricao,
  }) : super(
            id: id,
            nome: nome,
            preco: preco,
            estoque: estoque,
            cor: cor,
            descricao: descricao);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'estoque': estoque,
      'cor': cor,
      'descricao': descricao,
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'],
      nome: map['nome'],
      preco: map['preco'],
      estoque: map['estoque'],
      cor: map['cor'],
      descricao: map['descricao'],
    );
  }
}
