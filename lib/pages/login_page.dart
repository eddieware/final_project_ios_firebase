import 'package:flutter/cupertino.dart';
import 'package:final_project_ios_firebase/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _altoScreen;
  double _anchoScreen;
  String _email;
  String _pasword;

  GlobalKey<FormState> _formKey;

  _LoginPageState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    _altoScreen = MediaQuery.of(context).size.height;
    _anchoScreen = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Food App'),
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: _loginPageUI(),
      ),
    );
  }

  Widget _loginPageUI() {
    return Builder(
      builder: (BuildContext _context) {
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
      },
    );
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
            "Welcome to my App!",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          ),
          Text(
            "Please login to your account.",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  Widget _inputForm() {
    print(_email);

    print(_pasword);
    return Container(
      //color: CupertinoColors.activeBlue,
      height: _altoScreen * 0.26,
      child: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState.save();
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
        //controller: _txtEmailCntrllr,
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
      //controller: _txtEmailCntrllr,

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
          _pasword = _input;
        });
      },
      onSubmitted: (_input) {
        return _input.length != 0 ? null : print('Pls check lenght');
      },
    );
  }

  Widget _loginButton() {
    return
        // _auth.status == AuthStatus.Authenticating
        //     ? Align(
        //         alignment: Alignment.center,
        //         child: CircularProgressIndicator(),
        //       )
        //     :
        Container(
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
        onPressed: () {
          print('Button Pressed');
          if (_formKey.currentState.validate()) {
            print('Valid stuff things');
          }
        },
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        //NavigationService.instance.navigateTo("register");
        print('Este boton es para el registro');
      },
      child: Container(
        height: _altoScreen * 0.06,
        width: _anchoScreen,
        child: CupertinoButton(
          child: Text(
            "REGISTER",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: CupertinoColors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
