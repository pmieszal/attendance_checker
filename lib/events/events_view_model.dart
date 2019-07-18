import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:redux/redux.dart';

class EventsViewModel {
  final List<Event> events;

  EventsViewModel({
    this.events,
  });

  factory EventsViewModel.create(Store<AppState> store) =>
      EventsViewModel(events: store.state.eventsState.events,);
}
