import 'package:auth_project/layers/domain/entities/store_entity.dart';

class StoreDto extends StoreEntity {
  StoreDto({
    required String id,
    required String uid,
    required String nome,
    required String categoria,
    required String cnpj,
    required String local,
  }) : super(
          id: id,
          uid: uid,
          nome: nome,
          categoria: categoria,
          cnpj: cnpj,
          local: local,
        );

  StoreEntity toEntity() {
    return StoreEntity(
      id: id,
      uid: uid,
      nome: nome,
      categoria: categoria,
      cnpj: cnpj,
      local: local,
    );
  }

  factory StoreDto.fromEntity(StoreEntity storeEntity) {
    return StoreDto(
      id: storeEntity.id,
      uid: storeEntity.uid,
      nome: storeEntity.nome,
      categoria: storeEntity.categoria,
      cnpj: storeEntity.cnpj,
      local: storeEntity.local,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'nome': nome,
      'categoria': categoria,
      'cnpj': cnpj,
      'local': local,
    };
  }

  factory StoreDto.fromMap(Map<String, dynamic> map) {
    return StoreDto(
      id: map['id'],
      uid: map['uid'],
      nome: map['nome'],
      categoria: map['categoria'],
      cnpj: map['cnpj'],
      local: map['local'],
    );
  }
}
