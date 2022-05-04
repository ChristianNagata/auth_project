import 'package:auth_project/layers/domain/entities/product_entity.dart';

class ProductDto extends ProductEntity {
  ProductDto({
    required String id,
    required String storeId,
    required String nome,
    required double preco,
    required int estoque,
    required String cor,
    required String descricao,
  }) : super(
            id: id,
            storeId: storeId,
            nome: nome,
            preco: preco,
            estoque: estoque,
            cor: cor,
            descricao: descricao);

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      storeId: storeId,
      nome: nome,
      preco: preco,
      estoque: estoque,
      cor: cor,
      descricao: descricao,
    );
  }

  factory ProductDto.fromEntity(ProductEntity entity) {
    return ProductDto(
      id: entity.id,
      storeId: entity.storeId,
      nome: entity.nome,
      preco: entity.preco,
      estoque: entity.estoque,
      cor: entity.cor,
      descricao: entity.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'storeId': storeId,
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
      storeId: map['storeId'],
      nome: map['nome'],
      preco: map['preco'],
      estoque: map['estoque'],
      cor: map['cor'],
      descricao: map['descricao'],
    );
  }
}
