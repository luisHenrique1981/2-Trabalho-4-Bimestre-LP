// ignore_for_file: unnecessary_null_comparison, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lista_contatos/models/user.dart';
import 'package:lista_contatos/provider/users.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final Users usersProvider = Provider.of<Users>(context, listen: false);

    final avatar = user.avatar == null || user.avatar.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatar));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                _editContact(context, usersProvider, user);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                _confirmDelete(context, usersProvider, user);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editContact(BuildContext context, Users usersProvider, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController nameController = TextEditingController(text: user.name);
        final TextEditingController emailController = TextEditingController(text: user.email);

        return AlertDialog(
          title: const Text('Editar Contato'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Novo Nome'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Novo E-mail'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Atualizar o nome e o e-mail do usuário
                usersProvider.put(User(
                  id: user.id,
                  name: nameController.text,
                  email: emailController.text,
                  avatarUrl: user.avatar,
                  avatar: '',
                ));
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, Users usersProvider, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Contato'),
          content: const Text('Tem certeza de que deseja excluir este contato?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                usersProvider.remove(user);
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
