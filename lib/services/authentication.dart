import 'package:firebase_auth/firebase_auth.dart';

class MyAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return 'success';
    } on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found')  
        return 'user-not-found';
      else if(e.code == 'wrong-password')
        return 'wrong-password';
      else
        return e.toString();
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}