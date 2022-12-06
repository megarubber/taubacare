import 'package:firebase_database/firebase_database.dart';
import '../utilities/session.dart';

class MyDatabase {
  String path = 'default';

  DatabaseReference get dbRef => FirebaseDatabase.instance.ref().child(path);

  Future<void> insertUser({
    required String name, required String email,
    required String cpfOrCpnj, required String password,
    required bool isNaturalEntity
  }) async {
    this.path = 'users';
    if(isNaturalEntity) {
      await dbRef.push().set({
        'name': name,
        'email': email,
        'cpf': cpfOrCpnj,
        'password': password,
        'userType': 'natural'
      });
    } else {
      await dbRef.push().set({
        'name': name,
        'email': email,
        'cnpj': cpfOrCpnj,
        'password': password,
        'userType': 'juridical'
      });
    }
  }
	
  Future<void> insertOrganization({
    required String name, required String email,
    required String year, required String phone,
  }) async {
    this.path = 'organizations';
		await dbRef.push().set({
			'name': name,
			'email': email,
			'year': year,
			'phone': phone,
		});
  }
	
	void searchUsers([void Function(Object?)? f = null]) {
		this.path = 'users';
		dbRef.onValue.listen((DatabaseEvent event) {
			final users = event.snapshot.value;
			f?.call(users);
		});
	}

	Future<void> updateUsername(String whichName) async {
		this.path = 'users/' + Session.id;
		await dbRef.update({'name': whichName});
	}
}
