import 'package:attendance_checker/events/models/event.dart';

class EventsState {
  final List<Event> events;

  EventsState(
    this.events,
  );

  factory EventsState.initialState() => EventsState(List());
}