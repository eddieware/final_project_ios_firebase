import 'dart:io';

import 'package:final_project_ios_firebase/providers/auth_provider.dart';
import 'package:final_project_ios_firebase/services/cloud_storage_service.dart';
import 'package:final_project_ios_firebase/services/db_service.dart';
import 'package:final_project_ios_firebase/services/media_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  double _altodevice;
  double _anchodevice;

  //GlobalKey<FormState> _formKey;

  AuthProvider _auth;

  String _name;
  String _email;
  String _password;

  File _image;

  _RegistrationPageState() {
    //_formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    _altodevice = MediaQuery.of(context).size.height;
    _anchodevice = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Registro'),
          // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          backgroundColor: CupertinoColors.activeBlue,
        ),
        backgroundColor: CupertinoColors.black,
        child: Container(
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: registrationPageUI(),
          ),
        ));
  }

  Widget registrationPageUI() {
    return Builder(builder: (BuildContext _context) {
      _auth = Provider.of<AuthProvider>(_context);
      return Container(
        //color: CupertinoColors.destructiveRed,
        height: _altodevice * 0.75,
        padding: EdgeInsets.symmetric(horizontal: _anchodevice * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headingWidget(),
            _inputForm(),
            _registerButton(),
            _backToLoginPageButton()
          ],
        ),
      );
    });
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
          //key: _formKey,
          onChanged: () {
            //_formKey.currentState.save();
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
            ],
          )),
    );
  }

  Widget _imageHeadingWidget() {
    return Align(
        child: GestureDetector(
      onTap: () async {
        File _imageFile = await MediaService.instance.getImageFromLibrary();
        setState(() {
          _image = _imageFile;
        });
      },
      child: Container(
        height: _altodevice * 0.10,
        width: _altodevice * 0.10,
        decoration: BoxDecoration(
            color: CupertinoColors.systemGrey4,
            borderRadius: BorderRadius.circular(500),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: _image != null
                    ? FileImage(_image)
                    : NetworkImage(
                        "https://i0.wp.com/lrwa.org/wp-content/uploads/2020/01/register-icon.png?fit=250%2C242&ssl=1"))),
      ),
    ));
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
          // return _inputValidation.length != 0
          //     ? null
          //     : print('pls check your email');

          if (_inputValidation.length != 0 || null) {
            print('pls check your email');
          } else {
            _name = _inputValidation;
          }
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
            _name = _input;
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
          if (_inputValidation.length != 0 || null) {
            print('pls check your email');
          } else {
            _email = _inputValidation;
            print(_email);
          }
        },
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
        ),
        placeholder: 'test@test.com',
        onChanged: (_input) {
          //print(_input);
          setState(() {
            _email = _input;
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
        //print(_input);
        setState(() {
          _password = _input;
        });
      },
      onSubmitted: (_input) {
        if (_input.length != 0 || null) {
          print('pls check your password');
        } else {
          _password = _input;
        }
      },
    );
  }

  Widget _registerButton() {
    return _auth.status != AuthStatus.NotAuthenticated
        ? Container(
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
                  if (_image != null) {
                    print('SI PASO POR EL REGISTRO1');
                    _auth.registerUserWithEmailAndPassword(_email, _password,
                        (String _uid) async {
                      var _result = await CloudStorageService.instance
                          .uploadUserImage(_uid, _image);
                      var _imageURL = await _result.ref.getDownloadURL();
                      await DBService.instance
                          .createUserInDB(_uid, _name, _email, _imageURL);
                      //para regresar poseterior al registro
                      print('SI PASO POR EL REGISTRO');
                      Navigator.pushNamed(context, '/home');
                    });
                    //   DBService.instance.createUserInDB(
                    //       "0123456",
                    //       "lisav3",
                    //       "liza@gmailcom",
                    //       "https://scontent.fgdl10-1.fna.fbcdn.net/v/t1.0-9/96000604_2542606716054288_5177880257000112128_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_eui2=AeHECZXYqGge69kRUNJGSvEqAqXhaAbnJsMCpeFoBucmw5xfDG-JWwxiZ1yOfIE-q17SqQ8qWukakDG_whiuUdu8&_nc_ohc=nOiTl05GwHIAX8w9K-9&_nc_ht=scontent.fgdl10-1.fna&oh=4b54479c4199d77fe712a683ebed1b6d&oe=5F65DF53");
                    // }

                  }
                }
                //padding: EdgeInsets.symmetric(horizontal: 140, vertical: 7),
                ),
          )
        : Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
  }

  Widget _backToLoginPageButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
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
