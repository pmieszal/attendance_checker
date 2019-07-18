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

  NewEventViewModel({
    this.date,
    this.name,
    this.saveButtonEnabled,
    this.onAddEvent,
    this.changeName,
    this.changeDate,
  });

  factory NewEventViewModel.create(Store<AppState> store) {
    var event = store.state.newEventState.event;
    var name = event.name ?? "";
    var date = event.date ?? DateTime.now();

    var buttonEnabled = name.length >= 3;

    _onAddEvent() {
      if (buttonEnabled == false) {
        return;
      }

      var event = Event(name: name, date: date);
      store.dispatch(AddEventAction(event));
      store.dispatch(NewEventAction(Event()));
    }

    _changeName(String newName) {
      var event = Event(name: newName, date: date);
      store.dispatch(NewEventAction(event));
    }

    _changeDate(DateTime newDate) {
      var event = Event(name: name, date: newDate ?? date);
      store.dispatch(NewEventAction(event));
    }

    return NewEventViewModel(
      date: date,
      name: name,
      onAddEvent: _onAddEvent,
      changeName: _changeName,
      changeDate: _changeDate,
      saveButtonEnabled: buttonEnabled,
    );
  }
}
