import 'package:meta/meta.dart';

@immutable
abstract class RandomNumberEvent {}

class GetRandomNumber extends RandomNumberEvent {}
