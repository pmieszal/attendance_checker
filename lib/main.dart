import 'package:attendance_checker/events/events_view_model.dart';
import 'package:attendance_checker/events/events_widget.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/redux/app_state_reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
    return StoreConnector<AppState, EventsViewModel>(
        converter: (store) => EventsViewModel.create(store),
        builder: (context, viewModel) {
          return CupertinoApp(
            theme: CupertinoThemeData(
              primaryColor: Colors.green,
            ),
            home: EventsPage(viewModel),
          );
        });
  }
}
