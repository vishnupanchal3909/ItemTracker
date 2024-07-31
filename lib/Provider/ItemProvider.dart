import 'package:flutter/material.dart';
import '../Model/Item.dart';
import 'dart:math';

class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(String name, String description) {
    _items.add(Item(
      id: Random().nextDouble().toString(),
      name: name,
      description: description,
    ));
    notifyListeners();
  }

  void updateItem(String id, String name, String description) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index] = Item(
        id: id,
        name: name,
        description: description,
      );
      notifyListeners();
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
