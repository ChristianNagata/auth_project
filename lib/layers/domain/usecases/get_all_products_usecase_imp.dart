import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/domain/repositories/get_all_products_repository.dart';
import 'package:auth_project/layers/domain/usecases/get_all_products_usecase.dart';

class GetAllProductsUseCaseImp implements GetAllProductsUseCase {
  final GetAllProductsRepository _getAllProductsRepository;
  GetAllProductsUseCaseImp(this._getAllProductsRepository);

  @override
  Stream<List<ProductEntity>> call() {
    return _getAllProductsRepository.call();
  }
}