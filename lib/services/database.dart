import 'package:firebase_database/firebase_database.dart';

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
}
