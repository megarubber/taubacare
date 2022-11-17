import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';
import '../widgets/mycheckbox.dart';
import '../widgets/circle.dart';

enum UserType { naturalPerson, juridicalPerson }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Set a default value to force the user for one option
  UserType? _character = UserType.naturalPerson;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( 
            child: Stack(
              children: <Widget>[ 
                Circle(
                  diameter: 300.0, 
                  x: size.width * 0.5, 
                  y: size.height * -0.2,
                  color: Color(0xFFFFA195)
                ),
                Circle(
                  diameter: 300.0, 
                  x: size.width * -0.5, 
                  y: size.height * 0.7,
                  color: Color(0xFFFFA195)
                ),
                //Circle(diameter: 300.0, x: size.width * 0.8, y: 10),            
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.8,
                      height: 100,
                      child: Image.asset('assets/images/logo_taubacare.png'),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      'Fazer Login na Taubacare',
                      style: TextStyle(
                        fontFamily: 'MontserratAlternates',
                        fontSize: 20
                      )
                    ),
                    SizedBox(height: size.height * 0.02),
                    MyTextField(
                      hintText: 'Login',
                      validatorText: 'eae',
                      validExp: r'',
                      width: size.width * 0.9,
                    ),
                    SizedBox(height: size.height * 0.01),
                    MyTextField(
                      hintText: 'Senha',
                      validatorText: 'eae',
                      validExp: r'',
                      width: size.width * 0.9,
                    ),
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
                    SizedBox(height: size.height * 0.01),
                    MyButton(
                      width: size.width * 0.8,
                      height: size.height * 0.07,
                      message: 'Fazer Login',
                      color: Color(0xFF00BCD4)
                    ),
                    SizedBox(height: size.height * 0.03),
                    MyButton(
                      width: size.width * 0.8,
                      height: size.height * 0.07,
                      message: 'Cadastro',
                      color: Color(0xFF00BCD4),
                      action: () => Navigator.of(context).pushReplacementNamed('/register')
                    ),
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}