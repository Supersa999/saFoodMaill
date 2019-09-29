import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
// Explicit

//Method
Widget registerButton() {
  return IconButton(
    icon: Icon(Icons.cloud_upload),
    onPressed: () {},
  );
}

Widget nameText() {
  return TextFormField(
    decoration: InputDecoration(
      icon: Icon(
        Icons.face,
        size: 36.0,
      ),
      labelText: 'Display Name :',
      helperText: 'Type Your Name',
    ),
  );
}

Widget userText() {
  return TextFormField(
    decoration: InputDecoration(
      icon: Icon(
        Icons.account_box,
        size: 36.0,
      ),
      labelText: 'User :',
      helperText: 'Type Your User',
    ),
  );
}

Widget passwordText() {
  return TextFormField(
    decoration: InputDecoration(
      icon: Icon(
        Icons.lock,
        size: 36.0,
      ),
      labelText: 'Display password :',
      helperText: 'Type Your password',
    ),
  );
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: ListView(
        padding: EdgeInsets.all(50.0),
        children: <Widget>[
          nameText(),
          userText(),
          passwordText(),
        ],
      ),
    );
  }
}
