import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prototype_02_app/src/controller/app_controller.dart';

class LoginApi {
  FirebaseAuth get mAuth => FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  emailAccountReg(String email, String password) async {
    try {
      await mAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        rethrow;
      } else if (e.code == 'email-already-in-use') {
        rethrow;
      }
    }
  }

  emailSignIn(String email, String password) async {
    try {
      await mAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        rethrow;
      } else if (e.code == 'wrong-password') {
        rethrow;
      }
    }
  }

  signOut() async {
    if (mAuth.currentUser != null) {
      await mAuth.signOut();
    }
  }

  Future googleSignIn() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(credential.toString());
      await FirebaseAuth.instance.signInWithCredential(credential);
      mAuth.toString();
    }
  }
}
