import 'package:auth_project/core/usecases/usecase.dart';
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
import 'package:auth_project/layers/domain/usecases/auth_usecases/auth_state_changes_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_in_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_out_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/delete_product_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/get_all_products_from_store_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/save_product_usecasse.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/update_product_usecase.dart';
import 'package:auth_project/layers/presentation/controllers/user_controller.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:auth_project/layers/presentation/controllers/auth_controller.dart';
import 'package:auth_project/layers/presentation/controllers/store_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // Ordem: do mais interno ao mais externo

    getIt.registerLazySingleton<Uuid>(() => const Uuid());

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
    getIt.registerLazySingleton<UserUseCase>(() => UserUseCaseImp(getIt(), getIt()));

      // auth use cases
    getIt.registerLazySingleton<UseCase>(() => GetCurrentUserUseCase(getIt()));
    getIt.registerLazySingleton<UseCase>(() => AuthStateChangesUseCase(getIt()));
    getIt.registerLazySingleton<UseCase>(() => SignOutUseCase(getIt()));
    getIt.registerLazySingleton<UseCase>(() => SignInUseCase(getIt()));
    getIt.registerLazySingleton<UseCase>(() => SignUpUseCase(getIt()));

      // product use cases
    getIt.registerLazySingleton<UseCase>(() => GetAllProductsFromStoreUseCase(getIt(), getIt()));
    getIt.registerLazySingleton<UseCase>(() => DeleteProductUseCase(getIt()));
    getIt.registerLazySingleton<UseCase>(() => SaveProductUseCase(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<UseCase>(() => UpdateProductUseCase(getIt()));

    // CONTROLLERS
    getIt.registerLazySingleton<AuthController>(() => AuthController(getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<StoreController>(() => StoreController(getIt()));
    getIt.registerFactory<ProductController>(() => ProductController(getIt(), getIt(), getIt(), getIt()));
    getIt.registerFactory<UserController>(() => UserController(getIt()));

  }
}
