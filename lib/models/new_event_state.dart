import 'package:attendance_checker/events/models/event.dart';

class NewEventState {
  final Event event;

  NewEventState(
    this.event,
  );

  factory NewEventState.initialState() => NewEventState(Event());
}