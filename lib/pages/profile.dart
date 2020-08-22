import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double _altodevice;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Info Page'),
          // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          backgroundColor: CupertinoColors.activeBlue,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Bienvenido a tu Perfil",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.white),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey4,
                  borderRadius: BorderRadius.circular(500),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://fotos02.laopiniondemalaga.es/2018/11/24/1024x341/stan-lee.jpg'))),
            ),
          ],
        ));
  }
}
