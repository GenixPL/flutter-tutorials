import 'package:bloc_library_tutorial/pages/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/random_number_bloc.dart';

class GetNumberButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Get Number'),
      onPressed: () {
        final bloc = BlocProvider.of<RandomNumberBloc>(context);
        bloc.dispatch(GetRandomNumber());
      },
    );
  }

}