import 'package:dsi_login/screens/error_screen.dart';
import 'package:dsi_login/screens/success_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlashChat());
}

class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Container(child: Text(snapshot.error.toString()),),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => WelcomeScreen(),
                '/registration': (context) => RegistrationScreen(),
                '/login': (context) => LoginScreen(),
                '/error': (context) => ErrorScreen(),
                '/success': (context) => SuccessScreen(),
              },
            );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
