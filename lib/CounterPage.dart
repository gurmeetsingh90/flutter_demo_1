import 'package:bloc_demo/CounterState.dart';
import 'package:bloc_demo/IncrementEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CounterBloc.dart';
import 'DecrementEvent.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc Demo"),
      ),
      body: Center(
        child: StreamBuilder<CounterState>(
          stream: _bloc.getStateSink(),
          initialData: CounterState(0),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter : ${snapshot.data?.counter ?? 0}',
                    style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => _bloc.eventSink.add(IncrementEvent()),
                        child: Text('Increment ')),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () => _bloc.eventSink.add(DecrementEvent()),
                        child: Text('Decrement '))
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
