import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/events/redux/event_reducers.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:redux/redux.dart';

class NewEventViewModel {
  DateTime _date = DateTime.now();
  String _name = "";
  Function() onAddEvent;
  Function(String) changeName;
  Function(DateTime) changeDate;

  DateTime get date {
    return _date;
  }

  NewEventViewModel(Store<AppState> store) {
    onAddEvent = () {
      Event event = Event(_name, _date);
      store.dispatch(AddEventAction(event));
    };

    changeName = (String name) {
      _name = name;
      Event event = Event(_name, _date);
      store.dispatch(NewEventAction(event));
    };

    changeDate = (DateTime date) {
      _date = date;
      Event event = Event(_name, _date);
      store.dispatch(NewEventAction(event));
    };
  }
}
