import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';

class Settings extends StatelessWidget {
	TextEditingController _nameController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		var size = MediaQuery.of(context).size;
		return Scaffold(
			appBar: AppBar(
				title: Text('Configurações da conta'),
				leading: IconButton(
					icon: Icon(Icons.arrow_back_ios_rounded),
					onPressed: null
				)
			),
			body: SafeArea(
				child: Center(
					child: Column(
						children: <Widget>[
							Text('Nome atual da conta'),
							MyTextField(
								validatorText: 'Nome Inválido!',
								validExp: r'',
								width: size.width * 0.8,
								hintText: 'Digite um nome',
								controller: _nameController
							)
						]
					)
				)
			)
		);
	}
}
