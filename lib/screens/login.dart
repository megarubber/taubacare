import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';

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
                hintText: 'Login',
                validatorText: 'eae',
                validExp: r'',
                width: size.width * 0.8
              ),
              SizedBox(height: size.height * 0.01),
              MyTextField(
                hintText: 'Senha',
                validatorText: 'eae',
                validExp: r'',
                width: size.width * 0.8
              ),
              SizedBox(height: size.height * 0.01),
              MyButton(
                width: size.width * 0.8,
                message: 'Fazer Login'
              ),
              SizedBox(height: size.height * 0.03),
              MyButton(
                width: size.width * 0.8,
                message: 'Cadastro'
              ),
            ]
          )
        )
      )
    );
  }
}