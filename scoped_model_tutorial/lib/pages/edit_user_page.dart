import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_tutorial/models/age.dart';
import 'package:scoped_model_tutorial/models/name.dart';

class EditUserPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Name'),
            controller: _nameController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Age'),
            controller: _ageController,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  ScopedModel.of<NameModel>(context).name = _nameController.text;
                  ScopedModel.of<AgeModel>(context).age = _ageController.text;
                },
              ),
              ScopedModelDescendant<NameModel>(
                  builder: (context, child, model) =>
                      Text('Name: ${model.name}')),
              ScopedModelDescendant<AgeModel>(
                  builder: (context, child, model) =>
                      Text('Age: ${model.age}')),
            ],
          ),
        ],
      ),
    );
  }
}
