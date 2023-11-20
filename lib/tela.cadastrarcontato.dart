// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lista_contatos/models/user.dart';
import 'package:lista_contatos/provider/users.dart';
import 'package:provider/provider.dart';

class cadastro_contato extends StatelessWidget {
   cadastro_contato({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Contato"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid ?? false) {
                _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'] ?? '',
                  name: _formData['name'] ?? '',
                  email: _formData['email'] ?? '',
                  avatarUrl: _formData['avatarUrl'] ?? '',
                  avatar: '',
                ));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nome inválido";
                  }

                  if (value.trim().length <= 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
