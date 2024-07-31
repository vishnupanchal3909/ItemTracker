import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/ItemProvider.dart';


class ItemEditScreen extends StatefulWidget {
  final String? itemId;

  ItemEditScreen({this.itemId});

  @override
  _ItemEditScreenState createState() => _ItemEditScreenState();
}

class _ItemEditScreenState extends State<ItemEditScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.itemId != null) {
      final item = Provider.of<ItemProvider>(context, listen: false)
          .items
          .firstWhere((item) => item.id == widget.itemId);
      _nameController.text = item.name;
      _descriptionController.text = item.description;
    }
  }

  void _saveItem() {
    final name = _nameController.text;
    final description = _descriptionController.text;

    if (widget.itemId == null) {
      Provider.of<ItemProvider>(context, listen: false)
          .addItem(name, description);
    } else {
      Provider.of<ItemProvider>(context, listen: false)
          .updateItem(widget.itemId!, name, description);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // To measure and position a widget using RenderBox
    // final RenderBox renderBox = context.findRenderObject() as RenderBox;
    // final size = renderBox.size;
    // final position = renderBox.localToGlobal(Offset.zero);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemId == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save'),
              onPressed: _saveItem,
            ),
          ],
        ),
      ),
    );
  }
}
