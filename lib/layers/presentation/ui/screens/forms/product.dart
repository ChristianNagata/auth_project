import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:auth_project/layers/presentation/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProductForm extends StatelessWidget {
  var nome = '';
  var preco = 0.0;
  var cor = '';
  var descricao = '';
  var estoque = 1;
  Uuid uuid = const Uuid();

  ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = GetIt.I.get<ProductController>();

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
                padding: const EdgeInsets.only(top: 16),
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
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Cor do produto",
                  ),
                  onChanged: (value) {
                    cor = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Quantidade em estoque",
                  ),
                  onChanged: (value) {
                    estoque = int.parse(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Descrição",
                  ),
                  onChanged: (value) {
                    descricao = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () async {
                    await productController.saveProduct(
                      nome: nome,
                      preco: preco,
                      cor: cor,
                      descricao: descricao,
                      estoque: estoque,
                    );
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
