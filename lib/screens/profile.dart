import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    final Stream<DocumentSnapshot> _store = FirebaseFirestore.instance
        .collection('lojas')
        .doc(user!.uid)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _store,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: [
              ListTile(title: Text(snapshot.data!['nome'])),
              ListTile(title: Text(snapshot.data!['cnpj'])),
              ListTile(title: Text(snapshot.data!['categoria'])),
              ListTile(title: Text(snapshot.data!['local'])),
            ]
          );
        },
      ),
    );
  }
}
