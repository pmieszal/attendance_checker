import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:redux/redux.dart';

class EventsViewModel {
  final List<Event> events;
  final Function(String name, DateTime time) onAddEvent;

  EventsViewModel({
    this.events,
    this.onAddEvent,
  });

  factory EventsViewModel.create(Store<AppState> store) {
    _onAddEvent(String name, DateTime date) {
      Event event = Event(name, date);
      store.dispatch(AddEventAction(event));
    }

    return EventsViewModel(events: store.state.events, onAddEvent: _onAddEvent);
  }
}