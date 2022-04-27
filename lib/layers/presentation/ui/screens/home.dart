import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/auth_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  AuthController authController = GetIt.I.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: const Text('Profile'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () async {
                    await authController.signOut();
                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text('Sign out'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/products');
                  },
                  child: const Text('Products'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/somethingElse');
                  },
                  child: const Text('Page not found'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseCrashlytics.instance.crash();
                  },
                  child: const Text('Crash test'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
