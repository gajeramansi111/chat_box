import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class EmailAuthService {
  static signUpUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on Exception catch (e) {
      return e;
    }
  }

  static signInUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on Exception catch (e) {
      return e;
    }
  }

  static signOut() async {
    FirebaseAuth.instance.signOut();
  }

  static resetPassword({required String email}) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
