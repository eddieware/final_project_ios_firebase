import 'package:final_project_ios_firebase/pages/login_page.dart';
import 'package:final_project_ios_firebase/pages/profile.dart';
import 'package:final_project_ios_firebase/pages/registration_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => LoginPage(),
    '/profile': (BuildContext context) => ProfilePage(),
    '/register': (BuildContext context) => RegistrationPage(),
  };
}
