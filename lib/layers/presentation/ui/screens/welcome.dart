import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 360,
        elevation: 0,
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        title: const Text('Bem-vindo!'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 240),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signUp');
                  },
                  child: const Text('Ainda não tenho conta'),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signIn');
                    },
                    child: const Text('Já tenho conta'),
                    style: Theme.of(context).textButtonTheme.style,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
