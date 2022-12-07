import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';
import '../widgets/mycheckbox.dart';
import '../widgets/circle.dart';
import '../utilities/alltypes.dart';
import '../utilities/colors.dart';
import '../services/authentication.dart';
import '../utilities/session.dart';
import '../widgets/myalertdialog.dart';
import '../services/database.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Set a default value to force the user for one option
  UserType? _character = UserType.naturalPerson;
  MyAuthentication _auth = MyAuthentication();
	MyDatabase _database = MyDatabase();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
	bool _tryingLogin = false;

	@override
	void initState() {
		_database.searchUsers();
		super.initState();
	}

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
                  color: ProjectColors.lowRed
                ),
                Circle(
                  diameter: 300.0, 
                  x: size.width * -0.5, 
                  y: size.height * 0.7,
                  color: ProjectColors.lowRed
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
                    SizedBox(height: size.height * 0.05),
                    MyTextField(
                      hintText: 'E-mail',
                      validatorText: 'eae',
                      validExp: r'',
                      width: size.width * 0.9,
                      controller: this._emailController
                    ),
                    SizedBox(height: size.height * 0.01),
                    MyTextField(
                      hintText: 'Senha',
                      validatorText: 'eae',
                      validExp: r'',
                      width: size.width * 0.9,
                      passwordMode: true,
                      controller: this._passwordController
                    ),
                    /*
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
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
                    */
										Visibility(
											maintainSize: false,
											maintainAnimation: true,
											maintainState: true,
											visible: !this._tryingLogin,
											child: MyButton(
												width: size.width * 0.8,
												height: size.height * 0.07,
												message: 'Fazer Login',
												color: ProjectColors.teal,
												//action: () => Navigator.of(context).pushReplacementNamed('/home')
												action: () async {
													setState(() => this._tryingLogin = true);
													final String result = await _auth.signInWithEmailAndPassword(
														email: this._emailController.text,
														password: this._passwordController.text
													);
													switch(result) {
														case 'user-not-found':
															MyAlertDialog(
																context: context,
																title: 'Atenção!',
																message: 'Usuário não foi encontrado.',
															).spawnConfirmAlert();
															setState(() => this._tryingLogin = false);
															break;
														case 'wrong-password':
															MyAlertDialog(
																context: context,
																title: 'Atenção!',
																message: 'Senha incorreta',
															).spawnConfirmAlert();
															setState(() => this._tryingLogin = false);
															break;
														case 'success':
															_database.searchUsers((user) {
																if(user != null) {
																	Map u = user as Map;
																	u.forEach((k, value) {
																		if(value['email'] == this._emailController.text) {
																			Session.id = k;
																			Session.name = value['name'];
																			Session.email = this._emailController.text;
																		}
																	});
																} else Session.name = 'user';
															});
															/*
															if(Session.name != 'user') {
																Navigator.of(context).pushReplacementNamed('/home');
															} else {
																MyAlertDialog(
																	context: context,
																	title: 'Atenção!',
																	message: 'Usuário não foi encontrado.',
																).spawnConfirmAlert();
															}
															*/
															Navigator.of(context).pushReplacementNamed('/home');
															break;
														default:
															MyAlertDialog(
																context: context,
																title: 'Erro',
																message: 'Não foi possível fazer o login.',
															).spawnConfirmAlert();
															setState(() => this._tryingLogin = false);
															break;
													}
												}
											),
										),
										Visibility(
											maintainSize: false,
											maintainAnimation: true,
											maintainState: true,
											visible: this._tryingLogin,
											child: CircularProgressIndicator()
										),
										SizedBox(height: size.height * 0.03),
										MyButton(
											width: size.width * 0.8,
											height: size.height * 0.07,
											message: 'Cadastro',
											color: ProjectColors.teal,
											action: () {
												if(this._tryingLogin)
													return null;
												else
													Navigator.of(context).pushReplacementNamed('/register');
											}
										)
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
