import 'package:attendance_checker/new%20event/new_event_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventPage extends StatefulWidget {
  final NewEventViewModel viewModel;

  NewEventPage(this.viewModel);

  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("New Event"),
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CupertinoTextField(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            placeholder: "Name",
            onChanged: widget.viewModel.changeName,
          ),
          GestureDetector(
            onTap: _showDatePicker,
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
                      DateFormat.yMMMMEEEEd().format(widget.viewModel.date),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDatePicker() {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return _buildBottomPicker(
            CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: widget.viewModel.date,
              onDateTimeChanged: widget.viewModel.changeDate,
            ),
          );
        });
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
