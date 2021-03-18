

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  //static String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/yellow.png'),
                  ),
                ),
              ),
              Text(
                'Login Failed',style: TextStyle(
                  color: Colors.white,
                  fontSize: 50
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
