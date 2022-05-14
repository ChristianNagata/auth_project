import 'package:auth_project/layers/data/datasources/firebase/products_datasource_firestore_imp.dart';
import 'package:auth_project/layers/data/datasources/firebase/auth_datasource_firebaseauth_imp.dart';
import 'package:auth_project/layers/data/datasources/firebase/store_datasource_firestore_imp.dart';
import 'package:auth_project/layers/data/datasources/firebase/user_datasource_firestore_imp.dart';
import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:auth_project/layers/data/datasources/store_datasource.dart';
import 'package:auth_project/layers/data/datasources/user_datasource.dart';
import 'package:auth_project/layers/data/repositories/products_repository_imp.dart';
import 'package:auth_project/layers/data/repositories/auth_repository_imp.dart';
import 'package:auth_project/layers/data/repositories/store_repository_imp.dart';
import 'package:auth_project/layers/data/repositories/user_repository_imp.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/repositories/store_repository.dart';
import 'package:auth_project/layers/domain/repositories/user_repository.dart';
import 'package:auth_project/layers/presentation/controllers/user_controller.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:auth_project/layers/presentation/controllers/auth_controller.dart';
import 'package:auth_project/layers/presentation/controllers/store_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // Ordem: do mais interno ao mais externo
    // FIRESTORE
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

    // DATASOURCES
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceFirebaseAuthImp(getIt()));
    getIt.registerLazySingleton<StoreDataSource>(() => StoreDataSourceFirestoreImp(getIt(), getIt()));
    getIt.registerLazySingleton<ProductsDataSource>(() => ProductsDataSourceFirestoreImp(getIt()));
    getIt.registerLazySingleton<UserDataSource>(() => UserDataSourceFirestoreImp(getIt()));

    // REPOSITORIES
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));
    getIt.registerLazySingleton<StoreRepository>(() => StoreRepositoryImp(getIt()));
    getIt.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImp(getIt()));
    getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImp(getIt()));

    // USECASES
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImp(getIt()));
    getIt.registerLazySingleton<StoreUseCase>(() => StoreUseCaseImp(getIt(), getIt()));
    getIt.registerLazySingleton<ProductUseCase>(() => ProductUseCaseImp(getIt(), getIt()));
    getIt.registerLazySingleton<UserUseCase>(() => UserUseCaseImp(getIt(), getIt()));

    // CONTROLLERS
    getIt.registerLazySingleton<AuthController>(() => AuthController(getIt()));
    getIt.registerLazySingleton<StoreController>(() => StoreController(getIt()));
    getIt.registerFactory<ProductController>(() => ProductController(getIt()));
    getIt.registerFactory<UserController>(() => UserController(getIt()));

  }
}
