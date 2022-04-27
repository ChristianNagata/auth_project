import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreEntity? storeProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: (storeProvider == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.store),
                      radius: 24,
                    ),
                    title: Text(storeProvider.nome)),
                ListTile(title: Text(storeProvider.categoria)),
                ListTile(title: Text(storeProvider.cnpj)),
                ListTile(title: Text(storeProvider.local)),
                ListTile(title: Text(storeProvider.uid)),
              ],
            ),
    );
  }
}
