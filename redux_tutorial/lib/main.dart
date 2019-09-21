import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_tutorial/models/cart_item.dart';
import 'package:redux_tutorial/pages/home/home_page.dart';
import 'package:redux_tutorial/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<List<CartItem>>(appReducers, initialState: new List());

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<List<CartItem>> _store;

  MyApp(this._store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<CartItem>>(
      store: _store,
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
