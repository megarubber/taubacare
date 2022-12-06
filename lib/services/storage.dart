import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:typed_data';
import '../utilities/session.dart';

class MyStorage {
	String path = 'default';
	
	Reference get strRef => FirebaseStorage.instance.ref().child(this.path);
	
	void uploadProfilePicture(File file, String imageName) {
		this.path = 'users/' + imageName;
		strRef.putFile(file);
	}
	/*
	Future<Uint8List> downloadProfilePicture() async {
		this.path = 'users/' + Session.name + '.jpg';
		const oneMegabyte = 1024 * 1024;
		final Uint8List? data = await strRef.getData(oneMegabyte);
		final img = await rootBundle.load('assets/images/user_icon.png').buffer.asUint8List();
		return data ?? img;
	}
	*/
}
