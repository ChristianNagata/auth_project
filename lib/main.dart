import 'package:auth_project/firebase_services/authentication_service.dart';
import 'package:auth_project/providers/product_provider.dart';
import 'package:auth_project/screens/forms/edit_product.dart';
import 'package:auth_project/screens/forms/login.dart';
import 'package:auth_project/screens/forms/product.dart';
import 'package:auth_project/screens/forms/signup.dart';
import 'package:auth_project/screens/home.dart';
import 'package:auth_project/screens/products.dart';
import 'package:auth_project/screens/profile.dart';
import 'package:auth_project/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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

    return MultiProvider(
      providers: [
        Provider<AuthenticationService> (
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,),
        ChangeNotifierProvider.value(value: ProductProvider()),
      ],
      child: MaterialApp(
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
            )
          )
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const Home();
    }
    return const Welcome();
  }
}

