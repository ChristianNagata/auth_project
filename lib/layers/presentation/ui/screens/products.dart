import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/product_entity.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  Widget _buildListItem(BuildContext context, ProductEntity product) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.nome),
          const Icon(
            Icons.edit_outlined,
            size: 16,
          ),
        ],
      ),
      subtitle: Text("R\$ ${product.preco}"),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/editProductForm',
          arguments: product,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> myProducts = Provider.of<List<ProductEntity>>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: myProducts.isEmpty
          ? const Center(child: CircularProgressIndicator())
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
