import 'package:attendance_checker/models/app_state.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    eventsStateReducer(state.eventsState, action),
    newEventStateReducer(state.newEventState, action)
  );
}