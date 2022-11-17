import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';

class RegisterTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String validatorText;

  RegisterTextField({
    Key? key, 
    required this.icon, 
    required this.hintText,
    required this.validatorText
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Icon(this.icon, size: 50),
        ),
        SizedBox(
          width: size.width * 0.01
        ),
        MyTextField(
          hintText: this.hintText,
          width: size.width * 0.8,
          validExp: r'',
          validatorText: this.validatorText
        )
      ]
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Tela de Registro'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/login')
        )
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RegisterTextField(
                  validatorText: 'Digite um nome!',
                  hintText: 'Nome',
                  icon: Icons.accessibility_new_rounded
                ),
                RegisterTextField(
                  validatorText: 'Digite um e-mail!',
                  hintText: 'Email',
                  icon: Icons.alternate_email_rounded
                ),
                RegisterTextField(
                  validatorText: 'Digite uma CPF válido!',
                  hintText: 'CPF',
                  icon: Icons.card_travel
                ),
                RegisterTextField(
                  validatorText: 'Digite uma senha válida!',
                  hintText: 'Senha',
                  icon: Icons.password_rounded
                ),
                MyButton(
                  width: size.width * 0.8,
                  message: 'Concluir'
                ),
              ]
            )
          )
        )
      )
    );
  }
}