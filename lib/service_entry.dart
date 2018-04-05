import 'dart:async';

import 'package:flutter/material.dart';

class ServiceEntry extends StatefulWidget {
  static String tag = 'service-entry';
  @override
  _ServiceEntryState createState() => new _ServiceEntryState();
}

final DateTime selectedDate = DateTime.now();
// final ValueChanged<DateTime> selectDate;

Future<Null> _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: new DateTime(2015, 8),
      lastDate: new DateTime(2101));
  print(picked);
  // if (picked != null && picked != selectedDate) selectDate(picked);
}

Widget listView(BuildContext context) {
  return ListView(
    children: <Widget>[
      new RaisedButton(
          child: new Text("Date"),
          onPressed: () {
            _selectDate(context);
          }),
      new SizedBox(
        height: 10.0,
      ),
      new RaisedButton(
          child: new Text("Time"),
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: 7, minute: 28),
            );
          }),
      new SizedBox(
        height: 10.0,
      ),
      new TextField(
        decoration: InputDecoration(labelText: 'Customer'),
      ),
      new SizedBox(
        height: 10.0,
      ),
      new TextField(
        decoration: InputDecoration(labelText: 'SRN'),
      ),
      new TextField(
        decoration: InputDecoration(labelText: 'ESN'),
      ),
      new TextField(
        decoration: InputDecoration(labelText: 'ESN'),
      ),
      new RaisedButton(
        onPressed: () {
          showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text('What you typed'),
              content: new Text('hbhjbasd'),
            ),
          );
        },
        child: new Text('DONE'),
      ),
    ],
  );
}

class _ServiceEntryState extends State<ServiceEntry> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Service List Entry"),
      ),
      backgroundColor: Colors.white,
      body: new Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: listView(context),
      ),
    );
  }
}
