// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_contatos/data/dummy_users.dart';
import 'package:lista_contatos/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummy_users};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null && user.id.trim().isNotEmpty && !_items.containsKey(user.id)) {
      _items.update(user.id, (value) => User(id: user.id, name: user.name, email: user.email, avatarUrl: user.avatar, avatar: '',));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatar,
          avatar: '',
        ),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
