import 'package:auth_project/layers/domain/entities/store_entity.dart';

class StoreDto extends StoreEntity {
  StoreDto({
    required String uid,
    required String nome,
    required String categoria,
    required String cnpj,
    required String local,
  }) : super(
          uid: uid,
          nome: nome,
          categoria: categoria,
          cnpj: cnpj,
          local: local,
        );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nome': nome,
      'categoria': categoria,
      'cnpj': cnpj,
      'local': local,
    };
  }

  factory StoreDto.fromMap(Map<String, dynamic> map) {
    return StoreDto(
      uid: map['uid'],
      nome: map['nome'],
      categoria: map['categoria'],
      cnpj: map['cnpj'],
      local: map['local'],
    );
  }
}