import 'package:flutter/material.dart';
import 'package:redux_tutorial/pages/home/add_item_dialog.dart';
import 'package:redux_tutorial/pages/home/shopping_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: _buildBody(context),
      floatingActionButton: _buildActionButton(context),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: ShoppingList(),
    );
  }

  _buildActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _openAddItemDialog(context),
      child: Icon(Icons.add),
    );
  }

  _openAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(),
    );
  }
}
