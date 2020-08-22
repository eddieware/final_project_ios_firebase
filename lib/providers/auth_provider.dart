import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNotFound,
  Error,
}

class AuthProvider extends ChangeNotifier {
  FirebaseUser user;
  AuthStatus status;
  FirebaseAuth _auth;

  static AuthProvider instance = AuthProvider();

  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  void loginUserWithEmailAndPassword(
      String _email, String _password, Null Function() param2) async {
    status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      AuthResult _result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      user = _result.user;
      status = AuthStatus.Authenticated;
    } catch (e) {
      status = AuthStatus.Error;
      print('Login Error');
    }
    notifyListeners();
  }

  // void registerUserWithEmailAndPassword(String _email, String _password,
  //     Future<void> onSuccess(String _uid)) async {
  //   status = AuthStatus.Authenticating;
  //   notifyListeners();
  //   try {
  //     AuthResult _result = await _auth.createUserWithEmailAndPassword(
  //         email: _email, password: _password);
  //     user = _result.user;
  //     status = AuthStatus.Authenticated;
  //     await onSuccess(user.uid);
  //     print('Welcome, ${user.email}');
  //   } catch (e) {
  //     print(e);
  //     print('Error Rgistring user');
  //     status = AuthStatus.Error;
  //     user = null;
  //   }
  //   notifyListeners();
  // }

  void registerUserWithEmailAndPassword(String _email, String _password,
      Future<void> onSuccess(String _uid)) async {
    status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      AuthResult _result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      user = _result.user;
      status = AuthStatus.Authenticated;
      await onSuccess(user.uid);
    } catch (e) {
      status = AuthStatus.Error;
      user = null;
      //SnackBarService.instance.showSnackBarError("Error Registering User");
    }
    notifyListeners();
  }
}
