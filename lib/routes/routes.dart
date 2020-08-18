import 'package:final_project_ios_firebase/pages/profile.dart';
import 'package:final_project_ios_firebase/pages/sign_in.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => EmailSignInForm(),
    '/profile': (BuildContext context) => ProfileScreen(),
  };
}
