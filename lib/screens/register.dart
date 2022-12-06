import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';
import '../utilities/usertype.dart';
import '../utilities/colors.dart';
import '../services/database.dart';
import '../services/authentication.dart';
import '../widgets/myalertdialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  UserType? _character = UserType.naturalPerson;
  MyDatabase _myDatabase = MyDatabase();
	MyAuthentication _myAuth = MyAuthentication();

  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

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
                  icon: Icons.accessibility_new_rounded,
                  controller: _controllers[0]
                ),
                RegisterTextField(
                  validatorText: 'Digite um e-mail!',
                  hintText: 'Email',
                  icon: Icons.alternate_email_rounded,
                  controller: _controllers[1]
                ),
                Visibility(
                  child: RegisterTextField(
                    validatorText: 'Digite um CPF válido!',
                    hintText: 'CPF',
                    icon: Icons.card_travel,
                    formatter: '###.###.###-##',
                    controller: _controllers[2]
                  ),
                  visible: _character == UserType.naturalPerson
                ),
                Visibility(
                  child: RegisterTextField(
                    validatorText: 'Digite um CNPJ válido!',
                    hintText: 'CNPJ',
                    icon: Icons.card_travel,
                    formatter: '##.###.###/####-##',
                    controller: _controllers[2]
                  ),
                  visible: _character == UserType.juridicalPerson
                ),
                RegisterTextField(
                  validatorText: 'Digite uma senha válida!',
                  hintText: 'Senha',
                  icon: Icons.password_rounded,
                  passwordMode: true,
                  controller: _controllers[3]
                ),
                MyButton(
                  width: size.width * 0.8,
                  message: 'Concluir',
                  color: ProjectColors.red,
                  action: () {
										int state = 99;
										final RegExp exp = RegExp(r'^[a-zA-z]{1,}$');
										for(int i = 0; i < _controllers.length; i++) {
											if(!exp.hasMatch(_controllers[i].text))
												state = i;
												break;
										}
										
										switch(state) {
											case 0:
												MyAlertDialog(
													context: context,
													title: 'Erro',
													message: 'Digite um nome válido!'
												).spawnConfirmAlert();
												break;
											case 1:
												MyAlertDialog(
													context: context,
													title: 'Erro',
													message: 'Digite um email válido!'
												).spawnConfirmAlert();
												break;
											case 2:
												MyAlertDialog(
													context: context,
													title: 'Erro',
													message: 'Digite um CPF ou CPNJ válido!'
												).spawnConfirmAlert();
												break;
											case 3:
												MyAlertDialog(
													context: context,
													title: 'Erro',
													message: 'Digite uma senha válida!'
												).spawnConfirmAlert();
												break;
											default:
												if(_controllers[3].text.length >= 6) {
													Fluttertoast.showToast(
														msg: 'Cadastro concluído com sucesso!'
													);
													_myDatabase.insertUser(
														name: _controllers[0].text,
														email: _controllers[1].text,
														cpfOrCpnj: _controllers[2].text,
														password: _controllers[3].text,
														isNaturalEntity: _character == UserType.naturalPerson
													);
													_myAuth.createUserWithEmailAndPassword(
														email: _controllers[1].text,
														password: _controllers[3].text
													);
													Navigator.of(context).pushReplacementNamed('/login');
												} else {
													MyAlertDialog(
														context: context,
														title: 'Erro',
														message: 'A senha precisa ter 6 caracteres ou mais!'
													).spawnConfirmAlert();
												}
												break;
										}
                  }
                ),
              ]
            )
          )
        )
      )
    );
  }
}
