import 'package:auth_project/core/error/failures.dart';
import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Either<Failure, User?> getCurrentUser();
  Either<Failure, Stream<User?>> get authStateChanges;
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, bool>> signIn(AuthEntity authEntity);
  Future<Either<Failure, bool>> signUp(AuthEntity authEntity);
}