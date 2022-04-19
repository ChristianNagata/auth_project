import 'package:auth_project/main.dart';
import 'package:auth_project/screens/forms/edit_product.dart';
import 'package:auth_project/screens/forms/product.dart';
import 'package:auth_project/screens/forms/signin.dart';
import 'package:auth_project/screens/forms/signup.dart';
import 'package:auth_project/screens/forms/store_registration.dart';
import 'package:auth_project/screens/home.dart';
import 'package:auth_project/screens/products.dart';
import 'package:auth_project/screens/profile.dart';
import 'package:auth_project/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/authenticationWrapper':
        return MaterialPageRoute(builder: (_) => const AuthenticationWrapper());
      case '/':
        return MaterialPageRoute(builder: (_) => const Welcome());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/storeRegistration':
        return MaterialPageRoute(builder: (_) => StoreRegistration());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/products':
        return MaterialPageRoute(builder: (_) => Products());
      case '/productForm':
        return MaterialPageRoute(builder: (_) => ProductForm());
      case '/editProductForm':
        if (args is DocumentSnapshot<Object?>) {
          return MaterialPageRoute(
              builder: (_) => EditProductForm(documentSnapshot: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: const Center(
          child: Text(
            'ERROR',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
      );
    });
  }
}
