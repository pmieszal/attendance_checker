import 'package:attendance_checker/events/models/event.dart';

class AppState {
  final List<Event> events;
  final Event newEvent;

  AppState(this.events, this.newEvent);

  factory AppState.initialState() => new AppState(List(), null);
}
