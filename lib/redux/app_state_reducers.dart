import 'package:attendance_checker/events/redux/event_reducers.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/new%20event/redux/new_event_reducers.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    eventReducers(state.events, action),
    newEventReducers(state.newEvent, action)
  );
}