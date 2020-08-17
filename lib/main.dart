import 'package:final_project_ios_firebase/pages/sign_in.dart';
import 'package:final_project_ios_firebase/services/auth.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Cupertino App',
        home: EmailSignInForm(
          auth: Auth(),
        ));
  }
}
