import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LoginProvider {
  final _firebaseAuth = FirebaseAuth.instance;

 Future<String> signInWithEmailPass({@required String email, @required String password}) async {
   try {
     final AuthResult _authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
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

}