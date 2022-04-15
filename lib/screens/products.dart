import 'package:auth_project/screens/forms/edit_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'forms/product.dart';


class Products extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document, User user) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(document['nome']),
          const Icon(
            Icons.edit_outlined,
            size: 16,
          ),
        ],
      ),
      subtitle: Text("\$${document['preco']}"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProductForm(documentSnapshot: document, user: user),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> myProducts = FirebaseFirestore.instance
        .collection('lojas').doc(user!.uid).collection('produtos')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: myProducts,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data!.docs[index], user),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
