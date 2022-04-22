import 'package:firebase_auth/firebase_auth.dart';

abstract class GetCurrentUserRepository {
  User? call();
}