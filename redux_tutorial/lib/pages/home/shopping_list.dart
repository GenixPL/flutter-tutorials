import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_tutorial/models/cart_item.dart';
import 'package:redux_tutorial/pages/home/shopping_list_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) => ShoppingListItem(list[position]),
      ),
    );
  }
}
