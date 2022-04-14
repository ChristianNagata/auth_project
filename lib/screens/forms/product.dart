import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {

  var nome = '';
  var preco = 0.0;
  var uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('produtos');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product form'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite o nome",
                ),
                onChanged: (value) {
                  nome = value;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite o preço",
                  ),
                  onChanged: (value) {
                    preco = double.parse(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () {
                    products
                        .add({'nome': nome.trim(), 'preco': preco, 'uid': uid})
                        .then((value) => print('Product added'))
                        .catchError(
                            (error) => print('Failed to add product: $error'));
                    Navigator.pop(context);
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
