import 'package:dsi_login/constants.dart';
import 'package:dsi_login/rounded_button.dart';
import 'package:dsi_login/screens/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'error_screen.dart';

class LoginScreen extends StatefulWidget {
  //static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showspinner = false;
  User existinguser;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red[900],
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/yellow.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  controller: emailController,
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
                  controller: passwordController,
                    textAlign: TextAlign.center,
                    obscureText: !_passwordVisible,
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
                buttoncolor: Colors.lightBlueAccent,
                buttontext: 'Log in',
                onpress: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      showspinner = true;
                    });

                    try {
                      final olduser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      // final SharedPreferences prefs =
                      // await SharedPreferences.getInstance();
                      // existinguser = await _auth.currentUser;
                      // prefs.setString('username', existinguser.email);

                      if (olduser != null) {
                        Navigator.pushReplacementNamed(context, '/success');
                        print('login hahah');
                        emailController.clear();
                        passwordController.clear();
                      } else {
                        Navigator.pushReplacementNamed(context, '/error');
                        emailController.clear();
                        passwordController.clear();
                      }
                    } catch (e) {
                      setState(() {
                        showspinner = false;
                      });
                      Navigator.pushReplacementNamed(context, '/error');
                      print(e);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
