import 'dart:async';

import 'package:bloc_vanilla_tutorial/pages/block/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  // StreamController can be compared to box with two holes,
  // one for input (sink) and second for output (stream).
  // Program flow:
  // 1. EventController receives (through sink) a new event
  // 2. That event goes automatically to its output (stream)
  // 3. We listen to that stream and handle each event
  // 4. After given event is handled, we pass a proper state
  //    to a StateController's input (sink)
  // 5. Given state is automatically passed to StateController's 
  //    output (stream), from which it is received by connected widgets.


  // Event controller exposes only its sink, because that's the only
  // place receiving inputs (events) in a BLoC.
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  // State controller exposes (has public) only its stream, because 
  // that's the only thing that we output from a BLoC.
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _counterStateSink => _counterStateController.sink;
  Stream<int> get counterStateStream => _counterStateController.stream;


  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
 
  
  _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    }

    _counterStateSink.add(_counter);
  }
}
