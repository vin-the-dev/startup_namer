import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _setUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(_emailTextController.text);
    prefs.setString(
      'UserName',
      _emailTextController.text,
    );
  }

  TextEditingController _emailTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextField(
        keyboardType: TextInputType.text,
        autofocus: false,
        // initialValue: 'me@gmail.com',
        // onChanged: (String value) {
        //   print(value);
        //   _userName = value;
        //   setState(() {
        //     _userName;
        //   });
        // },
        controller: _emailTextController,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    final password = TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        initialValue: '',
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            // getData();
            _setUserName();
            // Navigator.of(context).pushNamed(HomePage.tag);
            Navigator.pushNamed(context, HomePage.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            children: <Widget>[
              logo,
              SizedBox(height: 40.0),
              email,
              SizedBox(height: 10.0),
              password,
              SizedBox(height: 20.0),
              loginButton
            ]),
      ),
    );
  }
}
