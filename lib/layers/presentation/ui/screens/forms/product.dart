import 'package:flutter/material.dart';


class ProductForm extends StatelessWidget {
  var nome = '';
  var preco = 0.0;
  var cor = '';
  var descricao = '';
  var estoque = 1;

  ProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  onPressed: () {
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
