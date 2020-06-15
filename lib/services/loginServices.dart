import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future<String> signInWithEmailPass({@required String email, @required String password}) async {
    try {
      final AuthResult _authResult =
          await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final FirebaseUser _firebaseUser = _authResult.user;
      return _firebaseUser.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;
    return user;
  }
}
