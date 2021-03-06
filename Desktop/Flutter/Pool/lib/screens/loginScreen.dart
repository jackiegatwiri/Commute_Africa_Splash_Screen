import 'package:flutter/material.dart';
import 'signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 10),
                child: Text("Welcome Back!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Image.asset("assets/illustration2.png"),
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    hintText: "Email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          top: 15), // add padding to adjust icon
                      child: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    hintText: "Password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          top: 15), // add padding to adjust icon
                      child: Icon(Icons.lock_open),
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Text("Forget Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blue))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Center(
                  child: ButtonTheme(
                    minWidth: 170.0,
                    height: 40.0,
                    child: RaisedButton(
                      elevation: 5,
                      animationDuration: Duration(seconds: 20),
                      splashColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/fb.png",
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/google.png",
                    width: 30.0,
                    height: 30.0,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text("Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
