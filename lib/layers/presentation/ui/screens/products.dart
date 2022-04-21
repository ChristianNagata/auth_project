import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  Widget _buildListItem(BuildContext context, document) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(document.nome),
          const Icon(
            Icons.edit_outlined,
            size: 16,
          ),
        ],
      ),
      subtitle: Text("\$${document.preco}"),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/editProductForm',
          arguments: document,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: const Text('Show a list of products ...'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/productForm');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
