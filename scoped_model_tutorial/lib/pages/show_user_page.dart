import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_tutorial/models/age.dart';
import 'package:scoped_model_tutorial/models/name.dart';

class ShowUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show User'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScopedModelDescendant<NameModel>(
              builder: (context, child, model) => Text('${model.name}'),
            ),
            ScopedModelDescendant<AgeModel>(
              builder: (context, child, model) => Text('${model.age}'),
            ),
          ],
        ),
      ),
    );
  }
}