import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/events/models/event.dart';
import 'package:redux/redux.dart';

List<Event> addEvent(List<Event> events, AddEventAction action) {
  return List.from(events)..add(action.event);
}

final Reducer <List<Event>> eventReducers = combineReducers <List<Event>>([
  new TypedReducer<List<Event>, AddEventAction>(addEvent),
]);

//TODO: move to separate file
class NewEventAction {
  final Event event;

  NewEventAction(this.event);
}

Event newEvent(Event event, NewEventAction action) {
  return action.event;
}

final Reducer <Event> newEventReducers = combineReducers <Event>([
  new TypedReducer<Event, NewEventAction>(newEvent),
]);