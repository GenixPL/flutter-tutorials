import 'package:bloc_library_tutorial/pages/bloc/bloc.dart';
import 'package:bloc_library_tutorial/pages/bloc/random_number_bloc.dart';
import 'package:bloc_library_tutorial/pages/get_number_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = RandomNumberBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          // this will pass bloc down to the widget tree
          bloc: _bloc,
          child: BlocListener(
            bloc: _bloc,
            listener: (context, RandomNumberState state) {
              if (state is RandomNumberLoaded) {
                print('number was loaded ');
              }
            },
            child: BlocBuilder(
              // it should only build widgets, any other functionality
              // should be moved to BlocListener
              bloc: _bloc,
              builder: (context, RandomNumberState state) {
                if (state is RandomNumberInitial) {
                  return _buildInitial(context);
                } else if (state is RandomNumberLoading) {
                  return _buildLoading(context);
                } else {
                  return _buildLoaded(context, state);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // REMEMBER ABOUT THIS
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  Widget _buildInitial(BuildContext context) {
    return GetNumberButton();
  }

  Widget _buildLoading(BuildContext context) {
    return CircularProgressIndicator();
  }

  Widget _buildLoaded(BuildContext context, RandomNumberLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${state.number}'),
        GetNumberButton(),
      ],
    );
  }
}
