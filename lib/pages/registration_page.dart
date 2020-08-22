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
      height: _altodevice * 0.35,
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
                    "https://www.eips.ca/uploads/15490364431100w_registernow1/1580856827-1100w_15490364431100w_registernow1.png"))),
      ),
    );
  }
}
