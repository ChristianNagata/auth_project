import 'package:auth_project/screens/login.dart';
import 'package:auth_project/screens/signup.dart';
import 'package:auth_project/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          color: Colors.orangeAccent,
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
      home: const Welcome(),
    );
  }
}
