// ignore_for_file: camel_case_types, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class tela_inicial extends StatelessWidget {
  const tela_inicial({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/livro-de-contato (1).png"),
              ),
              const SizedBox(height: 80), // Espaçamento entre a imagem e os botões
              SizedBox(
                width: double.infinity, // Define a largura total para os botões
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro_contato');
                  },
                  child: const Text("Novo Contato", style: TextStyle(color: Colors.black, fontSize: 25.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Define a cor branca para o botão
                  ),
                ),
              ),
              const SizedBox(height: 30), // Espaçamento entre os botões
              SizedBox(
                width: double.infinity, // Define a largura total para os botões
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/lista_contatos');
                  },
                  child: const Text("Lista de Contatos", style: TextStyle(color: Colors.black, fontSize: 25.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
