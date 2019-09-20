import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RandomNumberBloc extends Bloc<RandomNumberEvent, RandomNumberState> {
  @override
  RandomNumberState get initialState => RandomNumberInitial();

  @override
  Stream<RandomNumberState> mapEventToState(
    RandomNumberEvent event,
  ) async* {
    if (event is GetRandomNumber) {
      yield RandomNumberLoading();
      final number = await _getNumber();
      yield RandomNumberLoaded(number);
    }
  }

  Future<double> _getNumber() {
    return Future.delayed(Duration(seconds: 2), () {
      return Random().nextDouble();
    });
  }
}
