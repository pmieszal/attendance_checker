import 'package:attendance_checker/models/app_state.dart';
import 'package:attendance_checker/new%20event/new_event_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class NewEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<NewEventState, NewEventViewModel>(
      converter: (store) => NewEventViewModel.create(store),
      builder: (context, NewEventViewModel viewModel) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("New Event"),
              trailing: CupertinoButton(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: viewModel.saveButtonEnabled
                        ? Colors.lightGreen
                        : Colors.grey,
                  ),
                ),
                onPressed: viewModel.onAddEvent,
                padding: EdgeInsets.all(0),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                CupertinoTextField(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  placeholder: "Name",
                  onChanged: viewModel.changeName,
                ),
                GestureDetector(
                  onTap: () async {
                    var date = await _showDatePicker(context, viewModel.date);
                    viewModel.changeDate(date);
                  },
                  child: Row(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.2,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text("Date"),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            DateFormat.yMMMMEEEEd().format(viewModel.date),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Future<DateTime> _showDatePicker(
      BuildContext context, DateTime initial) async {
    DateTime selectedDate;
    await showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return _buildBottomPicker(
            CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initial,
              onDateTimeChanged: (date) => selectedDate = date,
            ),
          );
        });

    return selectedDate;
  }

  _buildBottomPicker(Widget picker) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
