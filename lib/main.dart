import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/home.dart';
import 'screens/settings.dart';
import 'screens/register_organization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/register': (BuildContext context) => const Register(),
        '/home' : (BuildContext context) => const Home(),
				'/settings' : (BuildContext context) => Settings(),
        '/register_organization' : (BuildContext context) => const RegisterOrganization(),
      }
    );
  }
}
