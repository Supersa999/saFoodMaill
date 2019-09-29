import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final fornKey = GlobalKey<FormState>();
String name,user,password;

//Method
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {

if (fornKey.currentState.validate()) {
  fornKey.currentState.save();
  print('name=$name,user=$user,password=$password');

}


      },
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
      ),validator: (String value){
        if (value.isEmpty) {
          return 'Please Fill Name in the Bank ';
        } else {
          return null;
        }
      },onSaved: (String value){
name= value.trim();
      },
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
      ),validator: (String value){

        if (value.isEmpty) {
          return 'Please Fill User in the Bank';
        } else {
          return null;
        }
      },onSaved: (String value){
        user = value.trim();
      },
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
      ),validator: (String value){
if (value.length< 6) {
  return 'Password More 6 Charecter';
} else {
  return null;
}

      },onSaved: (String value){
        password = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: fornKey,
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: <Widget>[
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
