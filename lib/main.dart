import 'package:attendance_checker/events/event_reducers.dart';
import 'package:attendance_checker/events/events_widget.dart';
import 'package:attendance_checker/events/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AppState {
  final List<Event> events;

  AppState(this.events);

  factory AppState.initialState() => new AppState(List());
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    eventReducers(state.events, action)
  );
}

void main() {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState(),
  );

  runApp(FlutterReduxApp(store));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;

  FlutterReduxApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Colors.green,
      ),
      home: EventsPage(),
    );
  }
}
