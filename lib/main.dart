import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/ItemProvider.dart';
import 'Screen/ItemListScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(),
    );
  }
}