import 'package:attendance_checker/events/redux/event_reducers.dart';
import 'package:attendance_checker/models/events_state.dart';

EventsState eventsStateReducer(EventsState state, action) => EventsState(
      eventReducers(state.events, action),
    );