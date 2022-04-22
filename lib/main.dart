import 'package:auth_project/core/inject/inject.dart';
import 'package:auth_project/layers/presentation/controllers/auth_controller.dart';
import 'package:auth_project/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'layers/presentation/ui/screens/home.dart';
import 'layers/presentation/ui/screens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Inject.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const AuthProject());
}

class AuthProject extends StatelessWidget {
  const AuthProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.redAccent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(24, 16, 24, 16),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all(const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
            elevation: MaterialStateProperty.all(0),
          ))),
      initialRoute: '/authenticationWrapper',
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  AuthenticationWrapper({Key? key}) : super(key: key);
  AuthController authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = authController.getCurrentUser();
    if (firebaseUser != null) {
      return Home();
    }
    return const Welcome();
  }
}
