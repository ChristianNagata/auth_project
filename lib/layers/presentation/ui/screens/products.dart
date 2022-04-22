import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Products extends StatelessWidget {

  ProductController productController = GetIt.I.get<ProductController>();

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
      body: Text(productController.product.nome),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/productForm');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
