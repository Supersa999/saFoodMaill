import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:safoodmall/screens/my_service.dart';
import 'package:safoodmall/screens/register.dart';
import 'package:http/http.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Explicit
  final formKey = GlobalKey<FormState>();
  String user, password, name;

// Method
  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'sa food mall',
      style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.red[900],
          fontFamily: 'Oswald'),
    );
  }

  Widget userText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        decoration: InputDecoration(labelText: 'User:'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type User in the blank';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          user = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password:'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Plase Type Password in  Blank';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          password = value.trim();
        },
      ), //textFormFiels
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.red[900],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('user =$user,password=$password');
          checkAuthen();
        }
      },
    );
  }

  Future<Void> checkAuthen() async {
    String urlAPI =
        'https://www.androidthai.in.th/sa/getUserWhereUserSa.php?isAdd=true&User=$user';
    Response response = await get(urlAPI);
    var result = json.decode(response.body);
    print('result=$result');
    if (result.toString() == 'null') {
      myAlert('User Flase', 'No user in My database');
    } else {
      for (var map in result) {
        String turePasswrd = map['Password'];
        print('truePassword=$turePasswrd');
        name = map['Name'];

        if (password == turePasswrd) {
          print('workr');

          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => MyService(nameLogin: name,));
          Navigator.of(context).pushAndRemoveUntil(
              materialPageRoute, (Route<dynamic> route) => false);
        } else {
          myAlert('password Flase', 'Tye Again password');
        }

        // if (password == turePasswrd) {
        //   print('workr');

        // } else {
        //
        // }
      }
    }
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[okButton()],
          );
        });
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget signupButton() {
    return OutlineButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Clcik Sign Up');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());

        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showBotton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 5.0,
        ),
        signupButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.yellow[600]],
              radius: 1.0,
            ),
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  showLogo(),
                  showAppName(),
                  userText(),
                  passwordText(),
                  SizedBox(
                    height: 10.0,
                  ),
                  showBotton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
