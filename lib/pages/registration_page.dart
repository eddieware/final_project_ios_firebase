import 'package:flutter/cupertino.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  double _altodevice;
  double _anchodevice;

  GlobalKey<FormState> _formKey;

  _RegistrationPageState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    _altodevice = MediaQuery.of(context).size.height;
    _anchodevice = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        child: Container(
          alignment: Alignment.center,
          child: signUpPageUI(),
        ));
  }

  Widget signUpPageUI() {
    return Container(
      //color: CupertinoColors.destructiveRed,
      height: _altodevice * 0.75,
      padding: EdgeInsets.symmetric(horizontal: _anchodevice * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_headingWidget(), _inputForm()],
      ),
    );
  }

  Widget _headingWidget() {
    return Container(
      //color: CupertinoColors.destructiveRed,
      height: _altodevice * 0.15, //para difinir la altura del alto del Widget
      width: _anchodevice * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Completa el Registro!",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: CupertinoColors.white),
          ),
          Text(
            "Por favor ingresa tus datos",
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
    return Container(
      //color: CupertinoColors.destructiveRed,
      height: _altodevice * 0.4,
      child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState.save();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _imageHeadingWidget(),
              _nameTextField(),
              _emailTextField(),
              _passwordTextField(),
              SizedBox(
                height: 10,
              ),
              _registerButton(),
              _backToLoginPageButton()
            ],
          )),
    );
  }

  Widget _imageHeadingWidget() {
    return Align(
      child: Container(
        height: _altodevice * 0.10,
        width: _altodevice * 0.10,
        decoration: BoxDecoration(
            color: CupertinoColors.systemGrey4,
            borderRadius: BorderRadius.circular(500),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i0.wp.com/lrwa.org/wp-content/uploads/2020/01/register-icon.png?fit=250%2C242&ssl=1"))),
      ),
    );
  }

  Widget _nameTextField() {
    return CupertinoTextField(
        //controller: _txtEmailCntrllr,

        prefix: Icon(
          CupertinoIcons.person_add_solid,
          color: CupertinoColors.systemGrey3,
          size: 35.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
        clearButtonMode: OverlayVisibilityMode.editing,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        onSubmitted: (_inputValidation) {
          return _inputValidation.length != 0
              ? null
              : print('pls check your email');
        },
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
        ),
        placeholder: 'Name',
        onChanged: (_input) {
          print(_input);
          setState(() {
            //_email = _input;
          });
        });
  }

  Widget _emailTextField() {
    return CupertinoTextField(
        // controller: _txtEmailCntrllr,
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
            // _email = _input;
          });
        });
  }

  Widget _passwordTextField() {
    return CupertinoTextField(
      //controller: _txtPassCntrllr,
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
          // _password = _input;
        });
      },
      onSubmitted: (_input) {
        return _input.length != 0 ? null : print('Pls check lenght');
      },
    );
  }

  Widget _registerButton() {
    return Container(
      height: _altodevice * 0.06,
      width: _anchodevice,
      child: CupertinoButton.filled(
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: CupertinoColors.white),
        ),
        onPressed: () {
          print('Register Button');
        },
        //padding: EdgeInsets.symmetric(horizontal: 140, vertical: 7),
      ),
    );
  }

  Widget _backToLoginPageButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: _altodevice * 0.08,
        width: _anchodevice,
        child: Icon(
          CupertinoIcons.back,
          size: 32,
        ),
      ),
    );
  }
}
