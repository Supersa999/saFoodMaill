import 'package:flutter/material.dart';
import 'package:safoodmall/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Explicit

// Method
  Widget showLogo() {
    return Container(
      width: 160.0,
      height: 160.0,
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
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 200.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password:'),
      ), //textFormFiels
    );
  }

  Widget signInButton() {
    return RaisedButton(color: Colors.red[900],
      child: Text('Sign In',style: TextStyle(color: Colors.white),),
      onPressed: () {},
    );
  }

  Widget signupButton() {
    return OutlineButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Clcik Sign Up');
MaterialPageRoute  materialPageRoute = MaterialPageRoute(builder: (BuildContext context) =>Register());

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
              colors: [Colors.white, Colors.yellow[600]],radius: 1.0,
            ),
          ),
          child: Center(
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
    );
  }
}
