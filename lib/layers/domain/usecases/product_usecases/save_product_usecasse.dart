import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/usecases/store_usecases/get_store_information_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../entities/product_entity.dart';
import '../../entities/store_entity.dart';

class SaveProductUseCase extends UseCase<bool, Params> {
  final ProductsRepository _productsRepository;
  final GetStoreInformationUseCase _getStoreInformationUseCase;
  final Uuid _uuid;

  SaveProductUseCase(
    this._productsRepository,
    this._getStoreInformationUseCase,
    this._uuid,
  );

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    StoreEntity store = await _getStoreInformationUseCase();
    String storeId = store.id;

    ProductEntity product = ProductEntity(
      id: _uuid.v4(),
      storeId: storeId,
      nome: params.nome,
      preco: params.preco,
      estoque: params.estoque,
      cor: params.cor,
      descricao: params.descricao,
    );
    return await _productsRepository.saveProduct(product);
  }
}

class Params extends Equatable {
  final String nome;
  final double preco;
  final String descricao;
  final String cor;
  final int estoque;

  const Params({
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.cor,
    required this.estoque,
  });

  @override
  List<Object?> get props => [nome, preco, descricao, cor, estoque];
}
