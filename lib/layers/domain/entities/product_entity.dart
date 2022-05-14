import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String storeId;
  final String nome;
  final double preco;
  final int estoque;
  final String cor;
  final String descricao;

  const ProductEntity({
    required this.id,
    required this.storeId,
    required this.nome,
    required this.preco,
    required this.estoque,
    required this.cor,
    required this.descricao,
  });

  @override
  List<Object?> get props => [id, storeId, nome, cor];
}
