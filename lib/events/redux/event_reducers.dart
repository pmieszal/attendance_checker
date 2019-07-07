import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/events/models/event.dart';

List<Event> eventReducers(List<Event> events, dynamic action) {
  if (action is AddEventAction) {
    return addEvent(events, action);
  }

  return events;
}


List<Event> addEvent(List<Event> events, AddEventAction action) {
  return List.from(events)..add(action.event);
}