import 'package:final_project_ios_firebase/pages/login_page.dart';
import 'package:final_project_ios_firebase/routes/routes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DBService.instance.createUserInDB(
    //     "0123", "james", "james@gmailcom", "http://wwww.pravat.cc");
    return CupertinoApp(
      title: 'Cupertino App',
      home: LoginPage(),
      routes: getApplicationRoutes(),
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
            primaryColor: CupertinoColors.systemGrey4,
            textStyle: TextStyle(color: CupertinoColors.white)),
      ),
    );
  }
}
