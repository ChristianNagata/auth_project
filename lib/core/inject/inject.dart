import 'package:auth_project/layers/data/datasources/firebase/get_all_products_firestore_datasource_imp.dart';
import 'package:auth_project/layers/data/datasources/firebase/auth_datasource_firebaseauth_imp.dart';
import 'package:auth_project/layers/data/datasources/get_all_products_datasource.dart';
import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:auth_project/layers/data/repositories/get_all_products_repository_imp.dart';
import 'package:auth_project/layers/data/repositories/auth_repository_imp.dart';
import 'package:auth_project/layers/domain/repositories/get_all_products_repository.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/get_all_products_usecase.dart';
import 'package:auth_project/layers/domain/usecases/get_all_products_usecase_imp.dart';
import 'package:auth_project/layers/domain/usecases/get_current_user_usecase.dart';
import 'package:auth_project/layers/domain/usecases/get_current_user_usecase_imp.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:auth_project/layers/presentation/controllers/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;
    // Ordem: do mais interno ao mais externo
    // firestore
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    // datasources
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceFirebaseAuthImp(getIt()));
    getIt.registerLazySingleton<GetAllProductsDataSource>(
        () => GetAllProductsFirestoreDataSourceImp(getIt(), getIt()));
    // repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetAllProductsRepository>(
        () => GetAllProductsRepositoryImp(getIt()));
    // usecases
    getIt.registerLazySingleton<GetCurrentUserUseCase>(() => GetCurrentUserUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAllProductsUseCase>(
        () => GetAllProductsUseCaseImp(getIt()));
    // controllers
    getIt.registerLazySingleton<UserController>(() => UserController(getIt()));
    getIt.registerFactory<ProductController>(() => ProductController(getIt()));
  }
}
