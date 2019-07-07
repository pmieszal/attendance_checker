import 'package:attendance_checker/events/redux/event_reducers.dart';
import 'package:attendance_checker/models/app_state.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    eventReducers(state.events, action)
  );
}