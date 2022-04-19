import 'package:auth_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  Widget _buildListItem(BuildContext context, ProductModel document) {
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
    final List<ProductModel>? myProducts =
        Provider.of<List<ProductModel>?>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: myProducts == null
          ? const Text('Loading...')
          : ListView.builder(
              itemExtent: 80,
              itemCount: myProducts.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, myProducts[index]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/productForm');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
