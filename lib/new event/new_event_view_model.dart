import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:redux/redux.dart';

class NewEventViewModel {
  DateTime _date = DateTime.now();
  String _name = "";
  Function() onAddEvent;

  DateTime get date { return _date; }

  changeName(String name) => _name = name;
  changeDate(DateTime date) => _date = date;

  NewEventViewModel(Store<AppState> store) {
    onAddEvent = () {
      Event event = Event(_name, _date);
      store.dispatch(AddEventAction(event));
    };
  }
}
