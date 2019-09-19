import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_tutorial/models/age.dart';
import 'package:scoped_model_tutorial/models/name.dart';
import 'package:scoped_model_tutorial/pages/edit_user_page.dart';
import 'package:scoped_model_tutorial/pages/home_page.dart';
import 'package:scoped_model_tutorial/pages/show_user_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AgeModel>(
      model: AgeModel(),
      child: ScopedModel<NameModel>(
        model: NameModel(),
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/edit_user': (context) => EditUserPage(),
            '/show_user': (context) => ShowUserPage(),
          },
        ),
      ),
    );
  }
}
