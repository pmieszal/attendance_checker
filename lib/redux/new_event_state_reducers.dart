import 'package:attendance_checker/models/new_event_state.dart';
import 'package:attendance_checker/new%20event/redux/new_event_reducers.dart';

NewEventState newEventStateReducer(NewEventState state, action) =>
    NewEventState(
      newEventReducers(state.event, action),
    );