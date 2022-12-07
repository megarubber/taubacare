import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';
import '../widgets/mybutton.dart';
import '../utilities/session.dart';
import '../services/storage.dart';
import '../services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Settings extends StatefulWidget {
	const Settings({Key? key}) : super(key: key);

	@override
	State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
	TextEditingController _nameController = TextEditingController();
	final ImagePicker _picker = ImagePicker();
	XFile? _image;
	MyStorage _str = MyStorage();
	MyDatabase _database = MyDatabase();
	
	Future<void> _selectImage() async {
		final selectedImage = await _picker.pickImage(source: ImageSource.gallery);
		if(selectedImage == null) return;
		setState(() => this._image = selectedImage);
	}

	Future<void> _updateInfo() async {
		_str.uploadProfilePicture(File(this._image!.path), Session.name);
		_database.updateUsername(this._nameController.text);
		Fluttertoast.showToast(
			msg: 'Perfil atualizado com sucesso!'
		);
		Navigator.of(context).pushReplacementNamed('/home');
	}

	@override
	void initState() {
		_nameController.text = Session.name;
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		var size = MediaQuery.of(context).size;
		return Scaffold(
			appBar: AppBar(
				title: Text('Configurações da conta'),
				leading: IconButton(
					icon: Icon(Icons.arrow_back),
					onPressed: () => Navigator.of(context).pushReplacementNamed('/home')
				)
			),
			body: SafeArea(
				child: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
						/*
							SizedBox(
								width: size.width * 0.8,
								height: size.height * 0.2,
								child: Image.asset('')
							),
						*/
							SizedBox(height: size.height * 0.03),
							Text('Nome atual da conta'),
							SizedBox(height: size.height * 0.03),
							MyTextField(
								validatorText: 'Nome Inválido!',
								validExp: r'',
								width: size.width * 0.8,
								hintText: 'Digite um nome',
								controller: _nameController
							),
							MyButton(
								width: size.width * 0.8,
								message: 'Trocar imagem de perfil',
								action: () => _selectImage()
							),
							SizedBox(height: size.height * 0.03),
							MyButton(
								width: size.width * 0.8,
								message: 'Salvar alterações',
								action: () => _updateInfo()
							)
						]
					)
				)
			)
		);
	}
}
