import 'package:auth_project/layers/domain/entities/store_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreEntity? store = Provider.of<StoreEntity?>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: (store == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.store),
                      radius: 24,
                    ),
                    title: Text(store.nome)),
                ListTile(title: Text(store.categoria)),
                ListTile(title: Text(store.cnpj)),
                ListTile(title: Text(store.local)),
                ListTile(title: Text(store.uid)),
              ],
            ),
    );
  }
}
