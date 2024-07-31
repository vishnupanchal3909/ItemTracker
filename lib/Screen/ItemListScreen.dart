import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/ItemProvider.dart';
import 'ItemEditScreen.dart';


class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Tracker'),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemEditScreen(itemId: item.id),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        itemProvider.removeItem(item.id);
                      },
                    ),
                  ],
                ),
                onLongPress: () {
                  itemProvider.removeItem(item.id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemEditScreen(),
            ),
          );
        },
      ),
    );
  }
}
