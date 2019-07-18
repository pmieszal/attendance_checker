import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/redux/events_state_reducers.dart';
import 'package:attendance_checker/redux/new_event_state_reducers.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    eventsStateReducer(state.eventsState, action),
    newEventStateReducer(state.newEventState, action)
  );
}