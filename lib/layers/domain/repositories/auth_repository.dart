import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  User? getCurrentUser();
}