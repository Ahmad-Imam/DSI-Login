import 'package:dsi_login/constants.dart';
import 'package:dsi_login/rounded_button.dart';
import 'package:dsi_login/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'error_screen.dart';

class RegistrationScreen extends StatefulWidget {
  //static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showspinner = false;
  User existinguser;
  bool _passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: ModalProgressHUD(
            inAsyncCall: showspinner,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/red.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                          //Do something with the user input.
                        },
                        decoration: khintDecoration.copyWith(
                          //errorBorder: InputBorder({BorderSide borderside = BorderSide.none}),
                          hintText: 'Enter your email',
                          errorStyle: GoogleFonts.nobile(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter email!';
                          } else if (!value.contains('@')) {
                            print('invalid');
                            return 'Invalid Email';
                          } else
                            return null;
                        }),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                          //Do something with the user input.
                        },
                        decoration: khintDecoration.copyWith(
                          //errorBorder: InputBorder({BorderSide borderside = BorderSide.none}),
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            splashRadius: 3,
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          errorStyle: GoogleFonts.nobile(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password!';
                          } else
                            return null;
                        }),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    buttoncolor: Colors.blueAccent,
                    buttontext: 'Register',
                    onpress: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          showspinner = true;
                        });

                        try {
                          final newuser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          existinguser = _auth.currentUser;
                          print('email $email and pass $password');

                          // final SharedPreferences prefs =
                          // await SharedPreferences.getInstance();
                          // prefs.setString('username', existinguser.email);

                          if (newuser != null) {
                            Navigator.pushReplacementNamed(context, '/');
                            print('haha');
                          }
                        } catch (e) {
                          setState(() {
                            showspinner = false;
                          });
                          print(e);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
