import 'package:attendance_checker/events/event.dart';
import 'package:attendance_checker/events/event_actions.dart';
import 'package:attendance_checker/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EventsPage extends StatefulWidget {
  @override
  EventsPageState createState() => EventsPageState();
}

typedef OnItemAddedCallback = Function(String name, DateTime date);

class EventsPageState extends State<EventsPage> {
  int elements = 0;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
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
              itemCount: state.events.length,
              itemBuilder: (context, position) => getRow(state.events[position]),
            ));
      },
    );
  }

  navigateToNewEvent() {
    Navigator.of(context).push(
        CupertinoPageRoute(builder: (BuildContext context) => EventsPage()));
  }

  Widget getRow(Event event) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(event.name),
      ),
      onTap: () {
        setState(() {
          // widgets.add(getRow(widgets.length + 1));
          print('row $event');
        });
      },
    );
  }
}
