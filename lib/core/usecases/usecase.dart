import 'package:auth_project/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase {
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}