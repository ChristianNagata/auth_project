import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid, firstName, lastName, email;

  const UserEntity({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  List<Object?> get props => [uid, firstName, lastName, email];
}
