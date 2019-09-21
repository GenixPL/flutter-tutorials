import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_tutorial/models/cart_item.dart';
import 'package:redux_tutorial/redux/actions.dart';

typedef OnAddCallback = Function(String itemName);

class AddItemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnAddCallback>(
      converter: (store) {
        return (itemName) =>
            store.dispatch(AddItemAction(CartItem(itemName, false)));
      },
      builder: (context, callback) {
        return AddItemDialogWidget(callback);
      },
    );
  }
}

class AddItemDialogWidget extends StatefulWidget {
  final OnAddCallback callback;

  AddItemDialogWidget(this.callback);

  @override
  State<StatefulWidget> createState() => AddItemDialogWidgetState(callback);
}

class AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  String itemName;

  final OnAddCallback callback;

  AddItemDialogWidgetState(this.callback);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Item name',
                hintText: 'eg. Red Apples',
              ),
              onChanged: _handleTextChanged,
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            }),
        FlatButton(
            child: const Text('ADD'),
            onPressed: () {
              Navigator.pop(context);
              callback(itemName);
            })
      ],
    );
  }

  _handleTextChanged(String newItemName) {
    setState(() {
      itemName = newItemName;
    });
  }
}
