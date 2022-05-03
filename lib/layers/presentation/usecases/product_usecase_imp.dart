import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/product_usecase.dart';
import 'package:uuid/uuid.dart';

class ProductUseCaseImp implements ProductUseCase {
  final Uuid _uuid = const Uuid();
  final ProductsRepository _productsRepository;

  ProductUseCaseImp(this._productsRepository);

  @override
  Stream<List<ProductEntity>> getAllProducts() {
    return _productsRepository.getAllProducts();
  }

  @override
  Future<void> deleteItem(String productId) async {
    return await _productsRepository.deleteItem(productId);
  }

  @override
  Future<void> saveProduct({
    required String nome,
    required double preco,
    required String cor,
    required String descricao,
    required int estoque,
  }) async {
    if (nome.length > 3 && preco > 7.0 && estoque >= 1 && cor != '' && descricao != '') {
      ProductEntity product = ProductEntity(
        id: _uuid.v4(),
        nome: nome,
        preco: preco,
        estoque: estoque,
        cor: cor,
        descricao: descricao,
      );
      return await _productsRepository.saveProduct(product);
    } else {
      print('Os campos não estão preenchidos corretamente');
    }
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    return await _productsRepository.updateProduct(product);
  }
}
