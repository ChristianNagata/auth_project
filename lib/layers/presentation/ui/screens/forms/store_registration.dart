import 'package:auth_project/layers/data/dtos/store_dto.dart';
import 'package:auth_project/layers/presentation/controllers/auth_controller.dart';
import 'package:auth_project/layers/presentation/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class StoreRegistration extends StatefulWidget {
  const StoreRegistration({Key? key}) : super(key: key);

  @override
  State<StoreRegistration> createState() => _SignUpState();
}

class _SignUpState extends State<StoreRegistration> {
  final StoreController storeController = GetIt.I.get<StoreController>();
  final AuthController authController = GetIt.I.get<AuthController>();

  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeCNPJController = TextEditingController();
  final TextEditingController storeCategoryController = TextEditingController();
  final TextEditingController storeLocalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-up'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Cadastre-se',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome da loja',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeCNPJController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'CNPJ da loja',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeCategoryController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Categoria',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: storeLocalController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Endereço da loja',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                    onPressed: () async {
                      StoreDto store = StoreDto(
                        uid: authController.getCurrentUser()!.uid,
                        nome: storeNameController.text.trim(),
                        categoria: storeCategoryController.text.trim(),
                        cnpj: storeCNPJController.text.trim(),
                        local: storeLocalController.text.trim(),
                      );
                      await storeController.registerStore(store);
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: const Text('Cadastrar'),
                    style: Theme.of(context).elevatedButtonTheme.style),
              )
            ],
          ),
        ),
      ),
    );
  }
}
