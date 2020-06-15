import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginProvider {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _facebookSignIn = FacebookLogin();

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

  Future<void> firebaseLogout() async {
    await _firebaseAuth.signOut();
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

  Future<void> googleLogout() async {
    await _googleSignIn.signOut();
  }

  Future<FirebaseUser> signInWithFacebook() async {
    FacebookLoginResult _result =
        await _facebookSignIn.logIn(['email', 'public_profile']).catchError((e) {
      print(e);
    });
    if (_result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken accessToken = _result.accessToken;
      AuthCredential credentials =
          FacebookAuthProvider.getCredential(accessToken: accessToken.token);
      AuthResult authResult = await _firebaseAuth.signInWithCredential(credentials);
      FirebaseUser user = authResult.user;
      return user;
    } else if (_result.status == FacebookLoginStatus.error) {
      print('Error Logging in');
      return null;
    } else if (_result.status == FacebookLoginStatus.cancelledByUser) {
      print('Cancelled by user');
      return null;
    }
  }

  Future<void> facebookLogout() async {
    await _facebookSignIn.logOut();
  }
}
