import 'package:attendance_checker/models/events_state.dart';
import 'package:attendance_checker/models/new_event_state.dart';

class AppState {
  final EventsState eventsState;
  final NewEventState newEventState;

  AppState(this.eventsState, this.newEventState);

  factory AppState.initialState() =>
      AppState(EventsState.initialState(), NewEventState.initialState());
}
