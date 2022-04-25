import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/presentation/controllers/auth_controller.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'layers/presentation/ui/screens/forms/edit_product.dart';
import 'layers/presentation/ui/screens/forms/product.dart';
import 'layers/presentation/ui/screens/forms/signin.dart';
import 'layers/presentation/ui/screens/forms/signup.dart';
import 'layers/presentation/ui/screens/forms/store_registration.dart';
import 'layers/presentation/ui/screens/home.dart';
import 'layers/presentation/ui/screens/products.dart';
import 'layers/presentation/ui/screens/profile.dart';
import 'layers/presentation/ui/screens/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    final currentUser = GetIt.I.get<AuthController>().getCurrentUser();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => (currentUser == null) ? const Welcome() : Home());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case '/storeRegistration':
        return MaterialPageRoute(builder: (_) => const StoreRegistration());
      case '/home':
        return MaterialPageRoute(
            builder: (_) => (currentUser != null) ? Home() : const Welcome());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case '/products':
        return MaterialPageRoute(
            builder: (_) => StreamProvider.value(
                value: GetIt.I.get<ProductController>().getAllProducts(),
                initialData: const <ProductEntity>[],
                child: Products()));
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
