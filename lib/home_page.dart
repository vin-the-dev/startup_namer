import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'service_entry.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];

  Future<List> getData() async {
    // var response = await http.get(
    //     Uri.encodeFull('https://jsonplaceholder.typicode.com/users'),
    //     headers: {'Accept': 'application/json'});
    // Map lMap = {"count": "40"};
    // String lData = json.encode(lMap);

    var response = await http.get(
      Uri.encodeFull('https://jsonplaceholder.typicode.com/users'),
      headers: {'Accept': 'application/json'},
      // body: lData,
    );
    print("object123");
    // setState(() {
    data = json.decode(response.body);
    // });

    return data;
  }

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setState(() {});
  }

  Widget listView(List data1) {
    return ListView.builder(
        itemCount: data1.length,
        itemBuilder: (context, rowNumber) {
          return ListTile(
            title: new Text(data[rowNumber]['name']),
            subtitle: new Text(
              data[rowNumber]['email'],
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 15.0),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final Welcome = Text('Welcome', style: TextStyle(fontSize: 30.0));

    final newListView = ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, rowNumber) {
        return ListTile(
          title: new Text(data[rowNumber]['name']),
          subtitle: new Text(
            data[rowNumber]['email'],
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 15.0),
          ),
        );
      },
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text("Service List"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.exit_to_app),
            onPressed: () {
              print("logOut");
              _logout();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: new FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return listView(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.of(context).pushNamed(ServiceEntry.tag);
          Navigator.popAndPushNamed(context, ServiceEntry.tag);
        },
      ),
    );
  }
}
