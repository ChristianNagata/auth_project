import 'package:auth_project/route_generator.dart';
import 'package:flutter/material.dart';

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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
