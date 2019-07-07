import 'package:attendance_checker/events/events_view_model.dart';
import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/events/redux/event_actions.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EventsPage extends StatefulWidget {
  final EventsViewModel viewModel;

  EventsPage(this.viewModel);

  @override
  EventsPageState createState() => EventsPageState();
}

typedef OnItemAddedCallback = Function(String name, DateTime date);

class EventsPageState extends State<EventsPage> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("Events"),
              trailing: StoreConnector<AppState, OnItemAddedCallback>(
                converter: (store) {
                  return (name, date) => store.dispatch(
                      AddEventAction(Event(name, date)));
                },
                builder: (context, callback) {
                  return CupertinoButton(
                    onPressed: () {
                      callback("new", DateTime.now());
                    },
                    child: Icon(Icons.add),
                    padding: EdgeInsets.all(0),
                  );
                },
              ),
            ),
            child: ListView.builder(
              itemCount: widget.viewModel.events.length,
              itemBuilder: (context, position) => getRow(widget.viewModel.events[position]),
            ));
  }

  _navigateToNewEvent() {
    Navigator.of(context).push(
        CupertinoPageRoute(builder: (BuildContext context) => EventsPage(widget.viewModel)));
  }

  Widget getRow(Event event) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(event.name),
      ),
      onTap: () {
        setState(() {
          print('row ${event.name} ${event.date}');
        });
      },
    );
  }
}
