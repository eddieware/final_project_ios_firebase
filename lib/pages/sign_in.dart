import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmailSignInFormType { signIn, register }

class Signin_Page extends StatefulWidget {
  Signin_Page({Key key}) : super(key: key);

  @override
  _Signin_PageState createState() => _Signin_PageState();
}

class _Signin_PageState extends State<Signin_Page> {
  TextEditingController _txtPassCntrllr = new TextEditingController();
  TextEditingController _txtEmailCntrllr = new TextEditingController();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  String _selectedValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Food App'),
        backgroundColor: CupertinoColors.activeOrange,
      ),
      child: Container(
        //color: CupertinoColors.activeBlue,
        child: Card(
          margin: EdgeInsets.all(16.0),
          shadowColor: CupertinoColors.inactiveGray,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _buildChildren(),
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
        ),
      ),
      //backgroundColor: CupertinoColors.systemGrey2,
    );
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
  }

  List<Widget> _buildChildren() {
    final primaryText =
        _formType == EmailSignInFormType.signIn ? 'Sign In' : 'Create Acount';
    final secondText = _formType == EmailSignInFormType.signIn
        ? 'Need an Account'
        : 'Have an Acount';

    return [
      CupertinoTextField(
        controller: _txtEmailCntrllr,
        prefix: Icon(
          CupertinoIcons.mail_solid,
          color: CupertinoColors.systemGrey3,
          size: 35.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
        clearButtonMode: OverlayVisibilityMode.editing,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
        ),
        placeholder: 'Email',
        onChanged: (value) {
          value = _txtEmailCntrllr.toString();
          Text(value);
        },
      ),
      SizedBox(
        height: 10,
      ),
      CupertinoTextField(
        controller: _txtPassCntrllr,
        prefix: Icon(
          CupertinoIcons.padlock_solid,
          color: CupertinoColors.systemGrey3,
          size: 35.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
        clearButtonMode: OverlayVisibilityMode.editing,
        keyboardType: TextInputType.visiblePassword,
        autocorrect: false,
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
        ),
        placeholder: 'Type a password',
        obscureText: true,
      ),
      SizedBox(
        height: 10,
      ),
      CupertinoButton.filled(
        child: Text('Sign In'),
        onPressed: () => _showAction(context),
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      Text('')
    ];
  }

  void _showAction(BuildContext context) {
    //imprimimos
    print('${_txtEmailCntrllr.text}');
    print('${_txtPassCntrllr.text}');

    if (_txtEmailCntrllr.text == '' || _txtPassCntrllr.text == '') {
      print('Por favor llena los campos');

      showCupertinoDialog<String>(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('El Email o Contraseña NO coinsiden o NO estan llenos'),
            //content: Text('Desea guardar los cambios?'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Aceptar'),
                onPressed: () => Navigator.pop(context, 'Aceptar'),
              )
            ],
          );
        },
      ).then((value) {
        setState(() {
          _selectedValue = value;
        });
      });
    } else {
      print('campos llenos');
    }
  }
}
