import 'package:meta/meta.dart';

@immutable
abstract class RandomNumberState {}
  
class RandomNumberInitial extends RandomNumberState {}

class RandomNumberLoading extends RandomNumberState {}

class RandomNumberLoaded extends RandomNumberState {
  final double number;

  RandomNumberLoaded(this.number);
}
