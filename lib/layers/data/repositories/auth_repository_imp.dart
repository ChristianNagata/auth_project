import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImp(this._authDataSource);

  @override
  Either<Failure, User?> getCurrentUser() {
    try {
      User? currentUser = _authDataSource.getCurrentUser();
      return Right(currentUser);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Stream<User?>> get authStateChanges {
    try {
      Stream<User?> user = _authDataSource.authStateChanges;
      return Right(user);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signIn(AuthEntity authEntity) async {
    try {
      bool response = await _authDataSource.signIn(authEntity);
      return Right(response);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      bool response = await _authDataSource.signOut();
      return Right(response);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(AuthEntity authEntity) async {
    try {
      bool response = await _authDataSource.signUp(authEntity);
      return Right(response);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }
}
