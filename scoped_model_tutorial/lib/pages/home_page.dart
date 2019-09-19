import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              child: Text('edit'),
              onPressed: () {
                Navigator.pushNamed(context, '/edit_user');
              },
            ),

            RaisedButton(
              child: Text('show'),
              onPressed: () {
                Navigator.pushNamed(context, '/show_user');
              },
            ),

          ],
        ),
      ),
    );
  }
}
