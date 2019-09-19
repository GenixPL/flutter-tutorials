abstract class CounterEvent {}

// those are the events that will be passed into a BLoC

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}