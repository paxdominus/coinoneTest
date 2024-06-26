import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_options.dart';

class FirebaseFuncs {
  void iniFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<String> createUser({required String emailAddress,required String password}) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
    } catch (e) {
      return e.toString();
    }
    if (credential == null) {
      return "failed";
    }
    return "logged in";
  }

  Future<String> signInUser({required String emailAddress,required String password}) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
    if (credential == null) {
      return "failed";
    }
    return "logged in";
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isKeepLoggedIn", false);
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> keepLoggedInFunc({bool val = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool currValue = prefs.getBool("isKeepLoggedIn") ?? false;
    prefs.setBool("isKeepLoggedIn", currValue);
    prefs.setBool("isKeepLoggedIn", val);
    return val;
  }
}
