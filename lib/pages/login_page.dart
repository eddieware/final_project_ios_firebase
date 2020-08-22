import 'package:flutter/cupertino.dart';
import 'package:final_project_ios_firebase/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _txtPassCntrllr = new TextEditingController();
  TextEditingController _txtEmailCntrllr = new TextEditingController();

  double _altoScreen;
  double _anchoScreen;
  String _email;
  String _password;

  // GlobalKey<FormState> _formKey;
  AuthProvider _auth;

  // _LoginPageState() {
  //   _formKey = GlobalKey<FormState>();
  // }

  @override
  Widget build(BuildContext context) {
    _altoScreen = MediaQuery.of(context).size.height;
    _anchoScreen = MediaQuery.of(context).size.width;
    _txtEmailCntrllr.text = 'test@test.com';
    _txtPassCntrllr.text = 'password';

    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Login'),
          // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          backgroundColor: CupertinoColors.activeBlue,
        ),
        child: Align(
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: _loginPageUI(),
          ),
        ),
      ),
    );
  }

  Widget _loginPageUI() {
    //para usar el build context
    return Builder(builder: (BuildContext _context) {
      _auth = Provider.of<AuthProvider>(_context);

      return Container(
        //color: CupertinoColors.activeBlue,
        height: _altoScreen * 0.60,
        padding: EdgeInsets.symmetric(horizontal: _anchoScreen * 0.10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_headingWidget(), _inputForm()],
        ),
      );
    });
  }

  Widget _headingWidget() {
    return Container(
      //color: CupertinoColors.destructiveRed,
      height: _altoScreen * 0.16, //para difinir la altura del alto del Widget
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Welcome to EddiewareApp!",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: CupertinoColors.white),
          ),
          Text(
            "Please login to your account.",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w200,
                color: CupertinoColors.white),
          ),
        ],
      ),
    );
  }

  Widget _inputForm() {
    // print(_email);

    // print(_password);
    return Container(
      //color: CupertinoColors.activeBlue,

      height: _altoScreen * 0.26,
      child: Form(
        // key: _formKey,
        onChanged: () {
          // _formKey.currentState.save();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
            _passwordTextField(),
            _loginButton(),
            _registerButton()

            //_passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return CupertinoTextField(
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
        onSubmitted: (_inputValidation) {
          return _inputValidation.length != 0 && _inputValidation.contains("@")
              ? null
              : print('pls check your email');
        },
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
        ),
        placeholder: 'test@test.com',
        onChanged: (_input) {
          print(_input);
          setState(() {
            _email = _input;
          });
        });
  }

  Widget _passwordTextField() {
    return CupertinoTextField(
      controller: _txtPassCntrllr,
      prefix: Icon(
        CupertinoIcons.padlock_solid,
        color: CupertinoColors.systemGrey3,
        size: 35.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      obscureText: true,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'password',
      onChanged: (_input) {
        print(_input);
        setState(() {
          _password = _input;
        });
      },
      onSubmitted: (_input) {
        return _input.length != 0 ? null : print('Pls check lenght');
      },
    );
  }

  Widget _loginButton() {
    // _txtEmailCntrllr.text = 'test@test.com';
    // _txtPassCntrllr.text = 'password';
    return _auth.status == AuthStatus.Authenticating
        ? Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Container(
            height: _altoScreen * 0.06,
            width: _anchoScreen,
            child: CupertinoButton.filled(
              child: Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CupertinoColors.white),
              ),
              onPressed: () async {
                //para evitar el bug y esperar a que regrese antes de hacer el salto
                await _auth.loginUserWithEmailAndPassword(
                    _txtEmailCntrllr.text, _txtPassCntrllr.text);
                //print('${_auth.user}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                print('${_txtEmailCntrllr.text}');
                print('${_txtPassCntrllr.text}');
                if (_auth.user == null) {
                  print('Usuario no valido');
                } else {
                  print('Login Succesfully');
                  Navigator.pushNamed(context, '/profile');
                }
              },
            ),
          );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Container(
        height: _altoScreen * 0.06,
        width: _anchoScreen,
        child: Text(
          "REGISTER",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white60),
        ),
      ),
    );
  }
}
