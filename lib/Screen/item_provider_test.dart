import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../Provider/ItemProvider.dart';
import 'package:flutter/material.dart';

void main() {
  test('Add item', () {
    final provider = ItemProvider();
    provider.addItem('Test Item', 'Test Description');
    expect(provider.items.length, 1);
    expect(provider.items[0].name, 'Test Item');
  });

  test('Update item', () {
    final provider = ItemProvider();
    provider.addItem('Test Item', 'Test Description');
    final id = provider.items[0].id;
    provider.updateItem(id, 'Updated Item', 'Updated Description');
    expect(provider.items[0].name, 'Updated Item');
  });

  test('Remove item', () {
    final provider = ItemProvider();
    provider.addItem('Test Item', 'Test Description');
    final id = provider.items[0].id;
    provider.removeItem(id);
    expect(provider.items.length, 0);
  });
}
