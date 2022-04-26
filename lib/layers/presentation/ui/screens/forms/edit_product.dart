import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:auth_project/layers/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EditProductForm extends StatelessWidget {
  final ProductEntity productEntity;

  const EditProductForm({Key? key, required this.productEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = GetIt.I.get<ProductController>();

    String id = productEntity.id;
    String nome = productEntity.nome;
    double preco = productEntity.preco;
    String cor = productEntity.cor;
    String descricao = productEntity.descricao;
    int estoque = productEntity.estoque;

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
                  initialValue: preco.toString(),
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
                  initialValue: cor,
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
                  initialValue: estoque.toString(),
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
                  initialValue: descricao,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: ElevatedButton(
                        child: const Text('Salvar'),
                        onPressed: () async {
                          ProductEntity product = ProductEntity(
                            id: id,
                            nome: nome,
                            preco: preco,
                            estoque: estoque,
                            cor: cor,
                            descricao: descricao,
                          );
                          await productController.updateProduct(product);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Deletar'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () async {
                        await productController.deleteItem(id);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
