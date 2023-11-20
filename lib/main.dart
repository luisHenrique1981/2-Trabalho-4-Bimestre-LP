//Instituto Federal de Rondônia - IFRO - Campus Calama
//2° Informática Matutino
//Disciplina: Linguagem de Programação
//Discentes: Alan Guilherme Oliveira Souza e Luis Henrique Oliveira da Silva


// ignore_for_file: unused_local_variable
import 'package:lista_contatos/tela.cadastrarcontato.dart';
import 'package:lista_contatos/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos/tela_listacontatos.dart';
import 'package:lista_contatos/provider/users.dart';
import 'package:provider/provider.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
      title: 'Lista Contatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/',
    routes: {
      '/': (context) => const tela_inicial(),
      '/lista_contatos': (context) => const ListaContatos(),
      '/cadastro_contato': (context) =>  cadastro_contato(),
    },
    ),
    );
  }
}