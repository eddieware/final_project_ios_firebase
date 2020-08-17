import 'package:final_project_ios_firebase/pages/home_page.dart';
import 'package:final_project_ios_firebase/services/auth.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => HomePage(
          auth: Auth(),
        ),
  };
}
