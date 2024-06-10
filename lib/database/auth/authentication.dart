import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final _firebaseAuthentication = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuthentication.currentUser;
  Stream<User?> get authStateChanges =>
      _firebaseAuthentication.authStateChanges();

  Future<void> signInWithGoogle() async {
    await _firebaseAuthentication.signInWithProvider(GoogleAuthProvider());
  }
}
