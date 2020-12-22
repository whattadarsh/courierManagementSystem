import 'package:couriermanagementsystem/core/authentication/screens/onboarding_page.dart';
import 'package:couriermanagementsystem/modules/admin/features/home/screens/admin_welcome_page.dart';
import 'package:couriermanagementsystem/modules/admin/features/home/services/admin_info_services.dart';
import 'package:couriermanagementsystem/modules/customer/features/home/cust_welcome_page.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:couriermanagementsystem/modules/employee/home/screens/employee_welcome_page.dart';
import 'package:couriermanagementsystem/modules/employee/home/services/employee_info_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        // print("Error while siginig in. " + err.details["message"]);
        // errorMsg = err.details["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error Occured !! Please try again "),
            duration: Duration(seconds: 2),
          ),
        );
      });
    } catch (err) {
      // print("Error: " + err.details["message"]);
      // errorMsg = err.details["message"];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Occured !! Please try again "),
          duration: Duration(seconds: 2),
        ),
      );
    }

    final User currentUser = auth.currentUser;
    print('signInEmail succeeded: ${user.uid}');

    if (user != null && (user.uid == currentUser.uid)) {
      switch (role) {
        case "Customer":
          Provider.of<CustomerInfoServices>(context, listen: false).setUser(
              userId: user.uid,
              email: user.email,
              context: context,
              name: "",
              phoneNo: "");

          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
            WelcomePage.routeName,
            (Route<dynamic> route) => false,
            arguments: {"user": user, "role": role},
          );
          break;
        case "Employee":
          Provider.of<EmployeeInfoServices>(context, listen: false).setEmployee(
              userId: user.uid,
              email: user.email,
              context: context,
              name: "",
              phoneNo: "");
          Navigator.of(context).pop();

          Navigator.of(context).pushNamedAndRemoveUntil(
            EmployeeWelcomePage.routeName,
            (Route<dynamic> route) => false,
            arguments: {"user": user, "role": role},
          );
          break;
        case "Admin":
          Provider.of<AdminInfoServices>(context, listen: false).setAdmin(
              userId: user.uid,
              email: user.email,
              context: context,
              name: "",
              phoneNo: "");

          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
            AdminWelcomePage.routeName,
            (Route<dynamic> route) => false,
            arguments: {"user": user, "role": role},
          );
          break;
        default:
          Navigator.of(context).pop();

          Navigator.of(context).pushNamedAndRemoveUntil(
            AdminWelcomePage.routeName,
            ModalRoute.withName('/'),
            arguments: {"user": user, "role": role},
          );
          break;
      }
    }
    return errorMsg;
  }

  /// Handles Authentication Sigup
  Future<dynamic> handleSignUp({
    @required String email,
    @required String name,
    @required String phoneNo,
    @required String password,
    @required String role,
    @required BuildContext context,
  }) async {
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
        // print("Error while Creating Acc." + err.details["message"]);
        // errorMsg = err.details["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error Occured !! Please try again "),
            duration: Duration(seconds: 2),
          ),
        );
      });
    } catch (err) {
      // print("Error: " + err.details["message"]);
      // errorMsg = err.details["message"];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Occured !! Please try again "),
          duration: Duration(seconds: 2),
        ),
      );
    }
    final User currentUser = auth.currentUser;

    print('signUpEmail succeeded: ${user.uid}');

    if (user != null && (user.uid == currentUser.uid)) {
      switch (role) {
        case "Customer":
          Provider.of<CustomerInfoServices>(context, listen: false).setUser(
              userId: user.uid,
              email: user.email,
              context: context,
              name: name,
              phoneNo: phoneNo);

          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
            WelcomePage.routeName,
            (Route<dynamic> route) => false,
            arguments: {"user": user, "role": role},
          );
          break;
        case "Employee":
          Provider.of<EmployeeInfoServices>(context, listen: false).setEmployee(
              userId: user.uid,
              email: user.email,
              context: context,
              name: name,
              phoneNo: phoneNo);

          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
            EmployeeWelcomePage.routeName,
            (Route<dynamic> route) => false,
            arguments: {"user": user, "role": role},
          );
          break;
        case "Admin":
          Provider.of<AdminInfoServices>(context, listen: false).setAdmin(
              userId: user.uid,
              email: user.email,
              context: context,
              name: name,
              phoneNo: phoneNo);

          Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
            AdminWelcomePage.routeName,
            (Route<dynamic> route) => false,
            arguments: {"user": user, "role": role},
          );
          break;
        default:
          Navigator.of(context).pop();

          Navigator.of(context).pushNamedAndRemoveUntil(
            AdminWelcomePage.routeName,
            ModalRoute.withName('/'),
            arguments: {"user": user, "role": role},
          );
          break;
      }
    }
    return errorMsg;
  }

  Future<bool> signout(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    print("Signing Out: " + auth.currentUser.uid);
    await auth.signOut();
    Navigator.of(context).pop();

    Navigator.of(context).pushNamedAndRemoveUntil(
      OnboardingPage.routeName,
      (Route<dynamic> route) => false,
    );
    return true;
  }
}
