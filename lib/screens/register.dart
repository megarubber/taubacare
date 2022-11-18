import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';
import '../utilities/usertype.dart';
import '../utilities/colors.dart';

class RegisterTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String validatorText;
  final String? formatter;
  final bool passwordMode;

  RegisterTextField({
    Key? key, 
    required this.icon, 
    required this.hintText,
    required this.validatorText,
    this.formatter = null,
    this.passwordMode = false
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
          validatorText: this.validatorText,
          formatter: this.formatter,
          passwordMode: this.passwordMode
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
  UserType? _character = UserType.naturalPerson;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ProjectColors.teal,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Tela de Registro', 
          style: TextStyle(fontFamily: 'MontserratAlternates', fontWeight: FontWeight.w700)
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/login')
        ),
        backgroundColor: ProjectColors.white,
        foregroundColor: ProjectColors.black,
        elevation: 0
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<UserType>(
                        value: UserType.naturalPerson,
                        groupValue: _character,
                        onChanged: (UserType? value) => setState(() => _character = value)
                      ),
                      Text('Pessoa Física', style: TextStyle(fontFamily: 'Poppins')),
                      SizedBox(width: size.width * 0.03),
                      Radio<UserType>(
                        value: UserType.juridicalPerson,
                        groupValue: _character,
                        onChanged: (UserType? value) => setState(() => _character = value)
                      ),
                      Text('Pessoa Jurídica', style: TextStyle(fontFamily: 'Poppins')),
                    ]
                  ),
                ),
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
                Visibility(
                  child: RegisterTextField(
                    validatorText: 'Digite um CPF válido!',
                    hintText: 'CPF',
                    icon: Icons.card_travel,
                    formatter: '###.###.###-##'
                  ),
                  visible: _character == UserType.naturalPerson
                ),
                Visibility(
                  child: RegisterTextField(
                    validatorText: 'Digite um CNPJ válido!',
                    hintText: 'CNPJ',
                    icon: Icons.card_travel,
                    formatter: '##.###.###/####-##'
                  ),
                  visible: _character == UserType.juridicalPerson
                ),
                RegisterTextField(
                  validatorText: 'Digite uma senha válida!',
                  hintText: 'Senha',
                  icon: Icons.password_rounded,
                  passwordMode: true
                ),
                MyButton(
                  width: size.width * 0.8,
                  message: 'Concluir',
                  color: ProjectColors.red,
                  action: () {}
                ),
              ]
            )
          )
        )
      )
    );
  }
}