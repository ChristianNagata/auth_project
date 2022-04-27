import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity should not be null', () {
    StoreEntity storeEntity = StoreEntity(
      uid: '7VIQfxLxnBQzzjf7ekCTuvxkjWF2',
      nome: 'Loja Teste',
      categoria: 'Categoria Teste',
      cnpj: '11111111111',
      local: 'Local teste',
    );

    expect(storeEntity, isNotNull);

  });
}
