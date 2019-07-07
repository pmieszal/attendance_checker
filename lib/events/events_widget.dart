import 'package:attendance_checker/events/events_view_model.dart';
import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/new%20event/new_event_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

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
          trailing: CupertinoButton(
            onPressed: _navigateToNewEvent,
            child: Icon(Icons.add),
            padding: EdgeInsets.all(0),
          ),
        ),
        child: ListView.builder(
          itemCount: widget.viewModel.events.length,
          itemBuilder: (context, position) =>
              getRow(widget.viewModel.events[position]),
        ));
  }

  _navigateToNewEvent() {
    Navigator.of(context).push(
        CupertinoPageRoute(builder: (BuildContext context) => NewEventPage()));
  }

  Widget getRow(Event event) {
    String date = DateFormat.yMMMMEEEEd().format(event.date);

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Text(event.name),
            ),
            Text(
              date,
              textScaleFactor: 0.8,
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          print('row ${event.name} ${event.date}');
        });
      },
    );
  }
}
