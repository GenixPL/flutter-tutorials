import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_tutorial/models/cart_item.dart';
import 'package:redux_tutorial/redux/actions.dart';

typedef OnStateChanged = Function(CartItem item);

class ShoppingListItem extends StatelessWidget {
  final CartItem _cartItem;

  ShoppingListItem(this._cartItem);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnStateChanged>(
      converter: (store) {
        return (item) => store.dispatch(ToggleItemStateAction(item));
      },
      builder: (context, callback) => ListTile(
        title: Text('${_cartItem.name}'),
        leading: Checkbox(
          value: _cartItem.checked,
          onChanged: (bool newValue) {
            callback(CartItem(_cartItem.name, newValue));
          },
        ),
      ),
    );
  }
}
