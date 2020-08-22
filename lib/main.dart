import 'package:final_project_ios_firebase/pages/login_page.dart';
import 'package:final_project_ios_firebase/routes/routes.dart';
import 'package:final_project_ios_firebase/services/db_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DBService.instance.createUserInDB("01234", "lisa", "liza@gmailcom",
    //     "https://scontent.fgdl10-1.fna.fbcdn.net/v/t1.0-9/96000604_2542606716054288_5177880257000112128_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_eui2=AeHECZXYqGge69kRUNJGSvEqAqXhaAbnJsMCpeFoBucmw5xfDG-JWwxiZ1yOfIE-q17SqQ8qWukakDG_whiuUdu8&_nc_ohc=nOiTl05GwHIAX8w9K-9&_nc_ht=scontent.fgdl10-1.fna&oh=4b54479c4199d77fe712a683ebed1b6d&oe=5F65DF53");
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
