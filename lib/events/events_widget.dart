import 'package:attendance_checker/events/events_view_model.dart';
import 'package:attendance_checker/events/models/event.dart';
import 'package:attendance_checker/models/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import "package:intl/intl.dart";

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<EventsState, EventsViewModel>(
        converter: (store) => EventsViewModel.create(store),
        builder: (context, EventsViewModel viewModel) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("Events"),
              trailing: CupertinoButton(
                onPressed: () => _navigateToNewEvent(context),
                child: Icon(Icons.add),
                padding: EdgeInsets.all(0),
              ),
            ),
            child: ListView.builder(
              itemCount: viewModel.events.length,
              itemBuilder: (context, position) =>
                  getRow(viewModel.events[position]),
            ),
          );
        });
  }

  _navigateToNewEvent(BuildContext context) {
    Navigator.of(context).pushNamed("/new");
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
    );
  }
}

typedef OnItemAddedCallback = Function(String name, DateTime date);
