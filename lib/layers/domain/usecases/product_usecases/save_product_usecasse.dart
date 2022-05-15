import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../../entities/product_entity.dart';
import '../../entities/store_entity.dart';

class SaveProductUseCase extends UseCase {
  final ProductsRepository _productsRepository;
  final GetStoreInformationUseCase _getStoreInformationUseCase;
  final Uuid _uuid;

  SaveProductUseCase(
    this._productsRepository,
    this._getStoreInformationUseCase,
    this._uuid,
  );

  Future<Either<Failure, bool>> call({
    required String nome,
    required double preco,
    required String descricao,
    required String cor,
    required int estoque,
  }) async {
    StoreEntity store = await _getStoreInformationUseCase();
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
  }
}
