import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_options.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// sign up with google email services
  Future signInWithGoogle() async {
    final googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final AuthCredential userCredential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        final User user =
            (await _firebaseAuth.signInWithCredential(userCredential)).user!;
        print("signed in  ${user.displayName}");
        return user;
      } else {
        throw FirebaseAuthException(
            message: "sign in aborded by user", code: "ERROR_ABORDER_BY_USER");
      }
    }
  }

  Future<void> singOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
