import 'dart:async';

import 'package:bloc_demo/CountEvent.dart';
import 'package:bloc_demo/CounterState.dart';
import 'package:bloc_demo/DecrementEvent.dart';
import 'package:bloc_demo/IncrementEvent.dart';

class CounterBloc {
  int _counter = 0;

  // Stream Controller for events (inputs)
  final _eventController = StreamController<CountEvent>();

  Sink<CountEvent> get eventSink => _eventController.sink;

// StreamController for states (output)
  final _stateControler = StreamController<CounterState>();

  Stream<CounterState> getStateSink() {
    return _stateControler.stream;
  }

  CounterBloc() {
    // Listen to events and map them to states
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CountEvent countEvent) {
    if (countEvent is IncrementEvent) {
      _counter++;
    } else if (countEvent is DecrementEvent) {
      _counter--;
    }
    // Add the new state to the state controller
    _stateControler.sink.add(CounterState(_counter));
  }

  void dispose() {
    _eventController.close();
    _stateControler.close();
  }
}
