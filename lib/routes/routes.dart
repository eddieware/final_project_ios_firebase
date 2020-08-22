import 'package:final_project_ios_firebase/pages/card_page.dart';
import 'package:final_project_ios_firebase/pages/login_page.dart';
import 'package:final_project_ios_firebase/pages/home_screen.dart';
import 'package:final_project_ios_firebase/pages/registration_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => LoginPage(),
    '/profile': (BuildContext context) => HomeScreen(),
    '/register': (BuildContext context) => RegistrationPage(),
    '/cards': (BuildContext context) => CardScreen(),
  };
}
