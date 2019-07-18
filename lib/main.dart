import 'package:attendance_checker/events/events_widget.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/models/app_state.dart' as prefix0;
import 'package:attendance_checker/new%20event/new_event_widget.dart';
import 'package:attendance_checker/redux/app_state_reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

_loggingMiddleware(
    Store<prefix0.State> store, dynamic action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');

  next(action);
}

void main() {
  final store = Store<AppState>(
    appStateReducer,
    middleware: [_loggingMiddleware],
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
      child: CupertinoApp(
        theme: CupertinoThemeData(
          primaryColor: Colors.green,
        ),
        routes: {
          Navigator.defaultRouteName: (context) => EventsPage(),
          "/new": (context) => NewEventPage(),
        },
      ),
    );
  }
}
