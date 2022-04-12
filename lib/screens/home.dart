import 'package:auth_project/screens/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    String? userEmail = user?.email;

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
              Text(userEmail!),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  child: const Text('Sign out'),
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
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Products()),
                    );
                  },
                  child: const Text('Products'),
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
