import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../utilities/session.dart';

class MyStorage {
	String path = 'default';
	
	Reference get strRef => FirebaseStorage.instance.ref().child(this.path);
	
	void uploadProfilePicture(File file, String imageName) {
		this.path = 'users/' + imageName;
		strRef.putFile(file);
	}
	
	/*
	Unit8List? downloadProfilePicture() {
		this.path = 'users/' + Session.name;

	}
	*/
}
