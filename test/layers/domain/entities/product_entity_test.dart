import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity should not be null', () {
    ProductEntity productEntity = ProductEntity(
      id: '877b9b06-e7fe-4510-a2d3-775016eb972a',
      nome: 'Produto Teste',
      preco: 1989.98,
      estoque: 123,
      cor: 'Preto',
      descricao: 'Produto teste preto',
    );

    expect(productEntity, isNotNull);
  });
}
