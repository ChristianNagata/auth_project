

import 'package:firebase_auth/firebase_auth.dart';

abstract class GetCurrentUserUseCase {
  User? call();
}