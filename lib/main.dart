import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const Login(),
        '/register': (BuildContext context) => const Register()
      }
    );
  }
}