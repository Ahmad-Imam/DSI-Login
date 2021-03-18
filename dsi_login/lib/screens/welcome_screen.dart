
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
 // static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    controller = AnimationController(
//        duration: Duration(seconds: 1), vsync: this, upperBound: 100);
//
//    controller.forward();
//
//    controller.addListener(() {
//      setState(() {});
//      print(controller.value);
//    });
//  }

//   void getlogin() async {
//     //final SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString('username') != null) {
//
//       print(prefs.getString('username') + 'vdfsdf');
//
//       //Navigator.pushNamed(context, ChatScreen.id);
//     }
// //    else {
// //      print('baaaal');
// //      Navigator.pushNamed(context, WelcomeScreen.id);
// //    }
//   }

  void initState() {
    // TODO: implement initState
    super.initState();
    // getlogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/blue.png'),
                  height: 60,
                ),
              ),
              TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 200),
                text: ['DSI LOGIN'],
                textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.redAccent
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48.0,
          ),
          RoundedButton(
            buttoncolor: Colors.lightBlueAccent,
            buttontext: 'Log in',
            onpress: () {
              Navigator.pushNamed(context, '/login');
              //Go to login screen.
            },
          ),
          RoundedButton(
            buttoncolor: Colors.blueAccent,
            buttontext: 'Register',
            onpress: () {
              Navigator.pushNamed(context, '/registration');
              //Go to login screen.
            },
          ),
        ],
      ),
    );
  }
}