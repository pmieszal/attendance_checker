import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/new%20event/redux/new_event_action.dart';
import 'package:redux/redux.dart';

class NewEventViewModel {
  final DateTime date;
  final String name;
  final bool saveButtonEnabled;
  final Function() onAddEvent;
  final Function(String) changeName;
  final Function(DateTime) changeDate;

  NewEventViewModel(
    this.date,
    this.name,
    this.saveButtonEnabled,
    this.onAddEvent,
    this.changeName,
    this.changeDate,
  );

  factory NewEventViewModel.create(Store<AppState> store) {
    var event = store.state.newEventState.event;
    String name = event.name ?? "";
    DateTime date = event.date ?? DateTime.now();

    bool saveButtonEnabled = name.length >= 3;

    _onAddEvent() {
      if (saveButtonEnabled == false) { return; }

      Event event = Event(name: name, date: date);
      store.dispatch(AddEventAction(event));
      store.dispatch(NewEventAction(Event()));
    }

    _changeName(String newName) {
      Event event = Event(name: newName, date: date);
      store.dispatch(NewEventAction(event));
    }

    _changeDate(DateTime newDate) {
      Event event = Event(name: name, date: newDate ?? date);
      store.dispatch(NewEventAction(event));
    }
    return NewEventViewModel(date, name, saveButtonEnabled, _onAddEvent, _changeName, _changeDate);
  }
}
