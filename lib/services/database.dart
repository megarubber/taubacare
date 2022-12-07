import 'package:firebase_database/firebase_database.dart';
import '../utilities/session.dart';
import '../utilities/alltypes.dart';

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
		required String address, required OrganizationType type
  }) async {
    this.path = 'organizations';
		switch(type) {
			case OrganizationType.education:
				await dbRef.push().set({
					'name': name,
					'email': email,
					'year': year,
					'phone': phone,
					'address': address,
					'type': 'education'
				});
				break;
			case OrganizationType.assistance:
				await dbRef.push().set({
					'name': name,
					'email': email,
					'year': year,
					'phone': phone,
					'address': address,
					'type': 'assistance'
				});
				break;
			case OrganizationType.sports:
				await dbRef.push().set({
					'name': name,
					'email': email,
					'year': year,
					'phone': phone,
					'address': address,
					'type': 'sports'
				});
				break;
			default:
				break;
		}
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

	Future<Object?> getOrganizations() async {
		this.path = 'organizations';
		final snapshot = await dbRef.get();
		return snapshot!.value;
	}
}
