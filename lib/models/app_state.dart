import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_reducers.dart';
import 'package:attendance_checker/new%20event/redux/new_event_reducers.dart';

class AppState {

  final EventsState eventsState;
  final NewEventState newEventState;

  AppState(this.eventsState, this.newEventState);

  factory AppState.initialState() => new AppState(EventsState.initialState(), NewEventState.initialState());
}

class EventsState {
  final List<Event> events;

  EventsState(
    this.events,
  );

  factory EventsState.initialState() => new EventsState(List());
}

EventsState eventsStateReducer(EventsState state, action) {
  return EventsState(
    eventReducers(state.events, action),
  );
}

class NewEventState {
  final Event event;

  NewEventState(
    this.event,
  );

  factory NewEventState.initialState() => new NewEventState(null);
}

NewEventState newEventStateReducer(NewEventState state, action) {
  return NewEventState(
    newEventReducers(state.event, action),
  );
}
