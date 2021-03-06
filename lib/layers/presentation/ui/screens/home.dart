import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/auth_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  AuthController authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: ElevatedButton(
                    onPressed: () async {
                      await authController.signOut();
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: const Text('Sign out'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/products');
                    },
                    child: const Text('Products'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/somethingElse');
                    },
                    child: const Text('Page not found'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseCrashlytics.instance.crash();
                    },
                    child: const Text('Crash test'),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orangeAccent)),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
