import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          child: Center(child: Column(
            children: [
              const Text('Home screen'),
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
            ],
          )),
        ),
      ),
    );
  }
}
