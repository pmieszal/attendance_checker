import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/new%20event/redux/new_event_action.dart';
import 'package:redux/redux.dart';

class NewEventViewModel {
  final DateTime date;
  final String name;
  final Function() onAddEvent;
  final Function(String) changeName;
  final Function(DateTime) changeDate;

  NewEventViewModel(
    this.date,
    this.name,
    this.onAddEvent,
    this.changeName,
    this.changeDate,
  );

  factory NewEventViewModel.create(Store<AppState> store) {
    String name = "";
    DateTime date = DateTime.now();

    if (store.state.newEvent != null) {
      name = store.state.newEvent.name;
      date = store.state.newEvent.date;
    }

    _onAddEvent() {
      Event event = Event(name, date);
      store.dispatch(AddEventAction(event));
    }

    _changeName(String name) {
      Event event = Event(name, date);
      store.dispatch(NewEventAction(event));
    }

    _changeDate(DateTime date) {
      Event event = Event(name, date);
      store.dispatch(NewEventAction(event));
    }

    return NewEventViewModel(date, name, _onAddEvent, _changeName, _changeDate);
  }
}
