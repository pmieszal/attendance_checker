import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_reducers.dart';
import 'package:attendance_checker/new%20event/redux/new_event_reducers.dart';

abstract class State {
  
}

class AppState implements State {

  final EventsState eventsState;
  final NewEventState newEventState;

  AppState(this.eventsState, this.newEventState);

  factory AppState.initialState() => AppState(EventsState.initialState(), NewEventState.initialState());
}

class EventsState implements State {
  final List<Event> events;

  EventsState(
    this.events,
  );

  factory EventsState.initialState() => EventsState(List());
}

class ChangeEventsStateAction {
  final EventsState state;

  ChangeEventsStateAction(this.state);
}

EventsState eventsStateChange(EventsState state, ChangeEventsStateAction action) {
  return action.state;
}

EventsState eventsStateReducer(EventsState state, action) {
  return EventsState(
    eventReducers(state.events, action),
  );
}

class NewEventState implements State {
  final Event event;

  NewEventState(
    this.event,
  );

  factory NewEventState.initialState() => NewEventState(Event());
}

NewEventState newEventStateReducer(NewEventState state, action) {
  return NewEventState(
    newEventReducers(state.event, action),
  );
}
