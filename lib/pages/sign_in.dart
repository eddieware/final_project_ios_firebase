import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin_Page extends StatefulWidget {
  Signin_Page({Key key}) : super(key: key);

  @override
  _Signin_PageState createState() => _Signin_PageState();
}

class _Signin_PageState extends State<Signin_Page> {
  TextEditingController _txtPassCntrllr = new TextEditingController();
  TextEditingController _txtEmailCntrllr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Food App'),
        backgroundColor: CupertinoColors.activeOrange,
      ),
      child: ListView(
        children: <Widget>[
          _crearEmail(),
          _crearPassword(),
          _crearBoton(),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return CupertinoTextField(
      controller: _txtEmailCntrllr,
      prefix: Icon(
        CupertinoIcons.mail_solid,
        color: CupertinoColors.extraLightBackgroundGray,
        size: 35.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.5, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Email',
      onChanged: (value) {
        value = _txtEmailCntrllr.toString();
        Text(value);
      },
    );
  }

  Widget _crearPassword() {
    return CupertinoTextField(
      controller: _txtPassCntrllr,
      prefix: Icon(
        CupertinoIcons.padlock_solid,
        color: CupertinoColors.extraLightBackgroundGray,
        size: 35.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.5, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Type a password',
    );
  }

  Widget _crearBoton() {
    return CupertinoButton.filled(
      child: Text('Sign In'),
      onPressed: _signFunction,
      padding: EdgeInsets.symmetric(horizontal: 20),
    );
  }

  void _signFunction() {
    //print('SIGNIN FUNCTION');
    print('${_txtEmailCntrllr.text}');
    print('${_txtPassCntrllr.text}');
  }
}
