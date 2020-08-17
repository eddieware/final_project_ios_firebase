import 'package:final_project_ios_firebase/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});
  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  TextEditingController _txtPassCntrllr = new TextEditingController();
  TextEditingController _txtEmailCntrllr = new TextEditingController();

  String get _email => _txtEmailCntrllr.text;
  String get _password => _txtPassCntrllr.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

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
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';

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
        placeholder: 'test@test.com',
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
        placeholder: 'Type password',
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
      SizedBox(
        height: 10,
      ),
      //form
      CupertinoButton(child: Text(primaryText), onPressed: _submit),
      SizedBox(
        height: 10,
      ),
      SizedBox(height: 8.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed: _toggleFormType,
      ),
    ];
  }

  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print(e.toString());
    }
  }

  void _showAction(BuildContext context) async {
    //imprimimos
    print('${_txtEmailCntrllr.text}');
    print('${_txtPassCntrllr.text}');

    if (_txtEmailCntrllr.text == '' || _txtPassCntrllr.text == '') {
      //Limpiamos despues de que el usuario lleno mal

      print('Por favor llena los campos');
      _txtEmailCntrllr.clear();
      _txtPassCntrllr.clear();

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
      );
    } else {
      print('Campos llenos');

      try {
        if (_formType == EmailSignInFormType.signIn) {
          await widget.auth.signInWithEmailAndPassword(_email, _password);
        } else {
          await widget.auth.createUserWithEmailAndPassword(_email, _password);
        }
        Navigator.of(context).pop();
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
