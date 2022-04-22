import 'package:auth_project/layers/data/datasources/firebase/products_datasource_firestore_imp.dart';
import 'package:auth_project/layers/data/datasources/firebase/auth_datasource_firebaseauth_imp.dart';
import 'package:auth_project/layers/data/datasources/products_datasource.dart';
import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:auth_project/layers/data/repositories/products_repository_imp.dart';
import 'package:auth_project/layers/data/repositories/auth_repository_imp.dart';
import 'package:auth_project/layers/domain/repositories/products_repository.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_auth_state_changes_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_auth_state_changes_usecase_imp.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_in_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_in_usecase_imp.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_out_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_out_usecase_imp.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase_imp.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/get_all_products_usecase.dart';
import 'package:auth_project/layers/domain/usecases/product_usecases/get_all_products_usecase_imp.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase_imp.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:auth_project/layers/presentation/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // Ordem: do mais interno ao mais externo
    // FIRESTORE
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    // DATASOURCES
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceFirebaseAuthImp(getIt()));
    getIt.registerLazySingleton<ProductsDataSource>(
        () => ProductsDataSourceFirestoreImp(getIt(), getIt()));

    // REPOSITORIES
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(getIt()));
    getIt.registerLazySingleton<ProductsRepository>(
        () => ProductsRepositoryImp(getIt()));

    // USECASES
    // auth_usecases
    getIt.registerLazySingleton<GetCurrentUserUseCase>(() => GetCurrentUserUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAuthStateChangesUseCase>(() => GetAuthStateChangesUseCaseImp(getIt()));
    getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCaseImp(getIt()));
    getIt.registerLazySingleton<SignOutUseCase>(() => SignOutUseCaseImp(getIt()));
    getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCaseImp(getIt()));
    // product_usecases
    getIt.registerLazySingleton<GetAllProductsUseCase>(
        () => GetAllProductsUseCaseImp(getIt()));

    // CONTROLLERS
    getIt.registerLazySingleton<AuthController>(() => AuthController(getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerFactory<ProductController>(() => ProductController(getIt()));

  }
}