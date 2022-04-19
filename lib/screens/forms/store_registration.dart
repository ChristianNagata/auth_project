import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class StoreRegistration extends StatefulWidget {
  StoreRegistration({Key? key}) : super(key: key);

  @override
  State<StoreRegistration> createState() => _SignUpState();
}

class _SignUpState extends State<StoreRegistration> {
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeCNPJController = TextEditingController();
  final TextEditingController storeCategoryController = TextEditingController();
  final TextEditingController storeLocalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference lojas = FirebaseFirestore.instance.collection('lojas');
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-up'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Cadastre-se',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome da loja',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeCNPJController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'CNPJ da loja',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeCategoryController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Categoria',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeLocalController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Endereço da loja',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                    onPressed: () async {
                      lojas
                          .doc(user!.uid)
                          .set({
                            'nome': storeNameController.text.trim(),
                            'cnpj': storeCNPJController.text.trim(),
                            'local': storeLocalController.text.trim(),
                            'categoria': storeCategoryController.text.trim(),
                            'uid': user.uid,
                          })
                          .then((value) => print('Store added'))
                          .catchError(
                              (error) => print('Failed to add store: $error'));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AuthenticationWrapper()),
                      );
                    },
                    child: const Text('Cadastrar'),
                    style: Theme.of(context).elevatedButtonTheme.style),
              )
            ],
          ),
        ),
      ),
    );
  }
}
