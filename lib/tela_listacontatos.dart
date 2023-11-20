// ignore_for_file: camel_case_types, unused_local_variable, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:lista_contatos/components/user.tile.dart';
import 'package:lista_contatos/models/user.dart';
import 'package:provider/provider.dart';
import 'package:lista_contatos/provider/users.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({Key? key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(user: users.byIndex(i)),
      ),
    );
  }
}
