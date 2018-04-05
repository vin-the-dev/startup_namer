import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:english_words/english_words.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'service_entry.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userName = '';

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    ServiceEntry.tag: (context) => ServiceEntry(),
  };

  @override
  initState() {
    super.initState();
    _loadUserName();
  }

  _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString('UserName');
    setState(() {
      _userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userName == null || _userName == "") {
      return new MaterialApp(
        title: 'Startup Name Generator',
        home: LoginPage(),
        routes: routes,
      );
    } else {
      return new MaterialApp(
        title: 'Service Logs',
        home: HomePage(),
        routes: routes,
      );
    }
  }
}
