

import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  //static String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/blue.png'),
                  ),
                ),
              ),
              Text(
                'Login Successful',style: TextStyle(
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
