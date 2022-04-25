import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DocumentSnapshot<Map<String, dynamic>> storeProvider =
        Provider.of<DocumentSnapshot<Map<String, dynamic>>>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: ListView(children: [
        ListTile(title: Text(storeProvider.data()!['nome'])),
        ListTile(title: Text(storeProvider.data()!['cnpj'])),
        ListTile(title: Text(storeProvider.data()!['categoria'])),
        ListTile(title: Text(storeProvider.data()!['local'])),
      ]),
    );
  }
}
