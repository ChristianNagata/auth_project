import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProductForm extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const EditProductForm({Key? key, required this.documentSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var nome = documentSnapshot['nome'];
    var preco = documentSnapshot['preco'].toString();

    CollectionReference products =
        FirebaseFirestore.instance.collection('produtos');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
          child: Column(
            children: [
              TextFormField(
                initialValue: nome,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite o nome",
                ),
                onChanged: (value) {
                  nome = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  initialValue: preco,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite o preço",
                  ),
                  onChanged: (value) {
                    preco = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () {
                    products
                          .doc(documentSnapshot.id)
                          .update({'nome': nome, 'preco': preco})
                          .then((value) => print("Product Updated"))
                          .catchError((error) =>
                              print("Failed to update product: $error"));

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
