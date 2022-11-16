import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyTextField(
                validatorText: 'eae',
                validExp: r'',
                width: size.width * 0.8
              ),
              MyTextField(
                validatorText: 'eae',
                validExp: r'',
                width: size.width * 0.8
              ),
            ]
          )
        )
      )
    );
  }
}