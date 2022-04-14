import 'package:auth_project/screens/forms/edit_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'forms/product.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
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
            builder: (context) => EditProductForm(documentSnapshot: document),
          ),
        );
      },
    );
  }

  bool _value = true;

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> myProducts = FirebaseFirestore.instance
        .collection('produtos')
        .where('uid', isEqualTo: user?.uid)
        .snapshots();
    final Stream<QuerySnapshot> allProducts =
        FirebaseFirestore.instance.collection('produtos').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        toolbarHeight: 80,
        bottom: PreferredSize(
          preferredSize: const Size(48, 32),
          child: Row(
            children: [
              Switch(
                value: _value,
                onChanged: (bool value) {
                  setState(() {
                    _value = !_value;
                  });
                },
              ),
              const Text(
                'My products',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _value ? myProducts : allProducts,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data!.docs[index]),
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
