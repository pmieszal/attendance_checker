import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/new%20event/redux/new_event_action.dart';
import 'package:redux/redux.dart';

Event newEvent(Event event, NewEventAction action) {
  return action.event;
}

final Reducer<Event> newEventReducers = combineReducers <Event>([
  new TypedReducer<Event, NewEventAction>(newEvent),
]);