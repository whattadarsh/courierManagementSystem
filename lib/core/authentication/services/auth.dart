import 'package:firebase_auth/firebase_auth.dart';

// Refer to this for understanding changes after update  https://firebase.flutter.dev/docs/migration/
//https://firebase.flutter.dev/docs/overview/#initializing-flutterfire
//https://pub.dev/packages/firebase_auth
// https://pub.dev/packages/cloud_firestore
// https://pub.dev/packages/firebase_core
class AuthService {
  //Handles Authentication
  Future<User> handleSignInEmail(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final User currentUser = auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;
  }

  Future<User> handleSignUp(email, password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    return user;
  }

  Future<bool> googleSignout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    return true;
  }

  ///Sign out
  signOut() {
    print("Signing Out");
    FirebaseAuth.instance.signOut();
  }
}
