import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/events/models/event.dart';
import 'package:redux/redux.dart';

List<Event> addEvent(List<Event> events, AddEventAction action) {
  return List.from(events)..add(action.event);
}

final Reducer<List<Event>> eventReducers = combineReducers <List<Event>>([
  TypedReducer<List<Event>, AddEventAction>(addEvent),
]);
