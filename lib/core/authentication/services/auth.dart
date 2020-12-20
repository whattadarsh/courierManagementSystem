import 'package:couriermanagementsystem/core/authentication/screens/onboarding_page.dart';
import 'package:couriermanagementsystem/core/authentication/screens/personal_details_form.dart';
import 'package:couriermanagementsystem/modules/customer/features/home/cust_welcome_page.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// Refer to this for understanding changes after update:
// https://firebase.flutter.dev/docs/migration/
// https://firebase.flutter.dev/docs/overview/#initializing-flutterfire
// https://pub.dev/packages/firebase_auth
// https://pub.dev/packages/cloud_firestore
// https://pub.dev/packages/firebase_core
class AuthService {
  /// Handles Authentication Sigin
  Future<dynamic> handleSignInEmail(
      String email, String password, String role, BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String errorMsg = "";
    User user;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(
            "Credentials of user => Email: ${value.user.email} and  UID: ${value.user.uid}");
        user = value.user;
      }).catchError((err) {
        print("Error while siginig in. " + err.details["message"]);
        errorMsg = err.details["message"];
      });
    } catch (err) {
      print("Error: " + err.details["message"]);
      errorMsg = err.details["message"];
    }

    final User currentUser = auth.currentUser;
    print('signInEmail succeeded: ${user.uid}');

    if (user != null && (user.uid == currentUser.uid)) {
      //TODO: Show a form to fill these fields after login
      //TODO: Create db entry of user
      Navigator.of(context).pushNamedAndRemoveUntil(
        WelcomePage.routeName,
        (Route<dynamic> route) => false,
        arguments: {"user": user, "role": role},
      );
    }
    return errorMsg;
  }

  /// Handles Authentication Sigup
  Future<dynamic> handleSignUp(
      {@required String email,
      @required String name,
      @required String phoneNo,
      @required String password,
      @required String role,
      @required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String errorMsg = "";
    User user;
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (UserCredential value) {
          print(
              "Credentials of user=>Email: ${value.user.email} and  UID: ${value.user.uid}");
          user = value.user;
        },
      ).catchError((err) {
        print("Error while Creating Acc." + err.details["message"]);
        errorMsg = err.details["message"];
      });
    } catch (err) {
      print("Error: " + err.details["message"]);
      errorMsg = err.details["message"];
    }
    final User currentUser = auth.currentUser;

    print('signUpEmail succeeded: ${user.uid}');

    if (user != null && (user.uid == currentUser.uid)) {
      Provider.of<CustomerInfoServices>(context, listen: false).setUser(
          userId: user.uid,
          email: user.email,
          context: context,
          name: name,
          phoneNo: phoneNo);

      Navigator.of(context).pushNamedAndRemoveUntil(
        WelcomePage.routeName,
        (Route<dynamic> route) => false,
        arguments: {"user": user, "role": role},
      );
    }
    return errorMsg;
  }

  Future<bool> signout(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    print("Signing Out: " + auth.currentUser.uid);
    await auth.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      OnboardingPage.routeName,
      (Route<dynamic> route) => false,
    );
    return true;
  }
}
