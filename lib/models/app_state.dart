import 'package:attendance_checker/events/models/event.dart';

class AppState {
  final List<Event> events;

  AppState(this.events);

  factory AppState.initialState() => new AppState(List());
}
