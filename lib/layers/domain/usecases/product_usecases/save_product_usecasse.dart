import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecase.dart';
import 'package:uuid/uuid.dart';
import '../../entities/product_entity.dart';
import '../../entities/store_entity.dart';

class SaveProductUseCase {
  final ProductsRepository _productsRepository;
  final StoreUseCase _storeUseCase;
  final Uuid _uuid;

  SaveProductUseCase(
    this._productsRepository,
    this._storeUseCase,
    this._uuid,
  );

  Future<void> call({
    required String nome,
    required double preco,
    required String cor,
    required String descricao,
    required int estoque,
  }) async {
    if (nome.length > 3 &&
        preco > 7.0 &&
        estoque >= 1 &&
        cor != '' &&
        descricao != '') {
      StoreEntity store = await _storeUseCase.getStoreInformation();
      String storeId = store.id;

      ProductEntity product = ProductEntity(
        id: _uuid.v4(),
        storeId: storeId,
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
}
