// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/auth_provider.dart';
// import 'package:provider/provider.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

// class EmailSignInForm extends StatefulWidget {
//   @override
//   _EmailSignInFormState createState() => _EmailSignInFormState();
// }

// class _EmailSignInFormState extends State<EmailSignInForm> {
//   TextEditingController _txtPassCntrllr = new TextEditingController();
//   TextEditingController _txtEmailCntrllr = new TextEditingController();
//   AuthProvider _auth;

//   // String get _email => _txtEmailCntrllr.text;
//   // String get _password => _txtPassCntrllr.text;

//   @override
//   Widget build(BuildContext context) {
//     //To override and
//     _txtEmailCntrllr.text = 'test@test.com';
//     _txtPassCntrllr.text = 'password';

//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Food App'),
//         backgroundColor: CupertinoColors.activeOrange,
//       ),
//       child: Container(
//         //color: CupertinoColors.activeBlue,
//         child: Card(
//           margin: EdgeInsets.all(16.0),
//           shadowColor: CupertinoColors.inactiveGray,
//           elevation: 10,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: _buildChildren(),
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//             ),
//           ),
//         ),
//       ),
//       //backgroundColor: CupertinoColors.systemGrey2,
//     );
//   }

//   List<Widget> _buildChildren() {
//     return [
//       CupertinoTextField(
//         controller: _txtEmailCntrllr,
//         prefix: Icon(
//           CupertinoIcons.mail_solid,
//           color: CupertinoColors.systemGrey3,
//           size: 35.0,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
//         clearButtonMode: OverlayVisibilityMode.editing,
//         keyboardType: TextInputType.emailAddress,
//         autocorrect: false,
//         decoration: BoxDecoration(
//           border: Border(
//               bottom:
//                   BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
//         ),
//         placeholder: 'test@test.com',
//         onChanged: (value) {
//           value = _txtEmailCntrllr.toString();
//           Text(value);
//         },
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       CupertinoTextField(
//         controller: _txtPassCntrllr,
//         prefix: Icon(
//           CupertinoIcons.padlock_solid,
//           color: CupertinoColors.systemGrey3,
//           size: 35.0,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
//         clearButtonMode: OverlayVisibilityMode.editing,
//         keyboardType: TextInputType.visiblePassword,
//         autocorrect: false,
//         decoration: BoxDecoration(
//           border: Border(
//               bottom:
//                   BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
//         ),
//         placeholder: 'Type password',
//         obscureText: true,
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       CupertinoButton.filled(
//         child: Text('Sign In'),
//         onPressed: () {
//           _auth.loginUserWithEmailAndPassword(
//               _txtEmailCntrllr.text, _txtPassCntrllr.text);

//         },
//         padding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       SizedBox(
//         height: 10,
//       ),
//     ];
//   }

//   _showAction(BuildContext context) async {
//     print('Si entra al try !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

//     print('Si sale el Future !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

//     // Future<String> signInWithEmailAndPassword(
//     //     String email, String password) async {
//     //   print('Si entra al try !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//     //   FirebaseUser user = (await FirebaseAuth.instance
//     //           .signInWithEmailAndPassword(
//     //               email: _txtEmailCntrllr.text, password: _txtPassCntrllr.text))
//     //       .user; //Here it crashes
//     //   print('Si sale el Future !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

//     //   print(user.uid);
//     //   return user.uid;
//     // }

//     // Future<String> signInWithEmailAndPassword(
//     //     String email, String password) async {
//     //   FirebaseUser user = (await FirebaseAuth.instance
//     //           .signInWithEmailAndPassword(
//     //               email: _txtEmailCntrllr.text,
//     //               password: _txtPassCntrllr.text))
//     //       .user; //Here it crashes
//     //   print('Si sale el Future !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

//     //   print(user.uid);
//     //   return user.uid;

//     // imprimimos

//     // Auth auth;
//     // final validacionUsuario = auth.createUserWithEmailAndPassword(
//     //     _txtEmailCntrllr.text, _txtPassCntrllr.text);
//     // print('$validacionUsuario LINEA PARA PROBAR QUE IMPRIME');

//     print('Campos Llenos');
//     print('${_txtEmailCntrllr.text}');
//     print('${_txtPassCntrllr.text}');

//     if (_txtEmailCntrllr.text == '' || _txtPassCntrllr.text == '') {
//       //Limpiamos despues de que el usuario lleno mal

//       print('Por favor llena los campos');
//       _txtEmailCntrllr.clear();
//       _txtPassCntrllr.clear();

//       showCupertinoDialog<String>(
//         context: context,
//         builder: (context) {
//           return CupertinoAlertDialog(
//             title: Text('El Email o Contraseña NO coinsiden o NO estan llenos'),
//             //content: Text('Desea guardar los cambios?'),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 child: Text('Aceptar'),
//                 onPressed: () => Navigator.pop(context, 'Aceptar'),
//               )
//             ],
//           );
//         },
//       );
//     } else {
//       //validacion de errore
//       // print('Si entra al else !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

//       //Navigator.pushNamed(context, '/profile');
//     }
//   }
// }

////
///
///import 'package:flutter/cupertino.dart';
// import 'package:final_project_ios_firebase/providers/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _LoginPageState();
//   }
// }

// class _LoginPageState extends State<LoginPage> {
//   double _altoScreen;
//   double _anchoScreen;
//   String _email;
//   String _password;

//   GlobalKey<FormState> _formKey;
//   AuthProvider _auth;

//   _LoginPageState() {
//     _formKey = GlobalKey<FormState>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _altoScreen = MediaQuery.of(context).size.height;
//     _anchoScreen = MediaQuery.of(context).size.width;

//     return Material(
//       child: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: Text('Food App'),
//           backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
//         ),
//         child: Align(
//           alignment: Alignment.center,
//           child: ChangeNotifierProvider<AuthProvider>.value(
//             value: null,
//             child: _loginPageUI(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _loginPageUI() {
//     //para usar el build context
//     return Builder(builder: (BuildContext _context) {
//       _auth = Provider.of<AuthProvider>(context);
//       print(_auth.user);
//       return Container(
//         //color: CupertinoColors.activeBlue,
//         height: _altoScreen * 0.60,
//         padding: EdgeInsets.symmetric(horizontal: _anchoScreen * 0.10),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[_headingWidget(), _inputForm()],
//         ),
//       );
//     });
//   }

//   Widget _headingWidget() {
//     return Container(
//       //color: CupertinoColors.destructiveRed,
//       height: _altoScreen * 0.16, //para difinir la altura del alto del Widget
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             "Welcome to my App!",
//             style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
//           ),
//           Text(
//             "Please login to your account.",
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _inputForm() {
//     print(_email);

//     print(_password);
//     return Container(
//       //color: CupertinoColors.activeBlue,
//       height: _altoScreen * 0.26,
//       child: Form(
//         key: _formKey,
//         onChanged: () {
//           _formKey.currentState.save();
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             _emailTextField(),
//             _passwordTextField(),
//             _loginButton(),
//             _registerButton()

//             //_passwordTextField(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _emailTextField() {
//     return CupertinoTextField(
//         //controller: _txtEmailCntrllr,
//         prefix: Icon(
//           CupertinoIcons.mail_solid,
//           color: CupertinoColors.systemGrey3,
//           size: 35.0,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
//         clearButtonMode: OverlayVisibilityMode.editing,
//         keyboardType: TextInputType.emailAddress,
//         autocorrect: false,
//         onSubmitted: (_inputValidation) {
//           return _inputValidation.length != 0 && _inputValidation.contains("@")
//               ? null
//               : print('pls check your email');
//         },
//         decoration: BoxDecoration(
//           border: Border(
//               bottom:
//                   BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
//         ),
//         placeholder: 'test@test.com',
//         onChanged: (_input) {
//           print(_input);
//           setState(() {
//             _email = _input;
//           });
//         });
//   }

//   Widget _passwordTextField() {
//     return CupertinoTextField(
//       //controller: _txtEmailCntrllr,

//       prefix: Icon(
//         CupertinoIcons.padlock_solid,
//         color: CupertinoColors.systemGrey3,
//         size: 35.0,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
//       clearButtonMode: OverlayVisibilityMode.editing,
//       keyboardType: TextInputType.emailAddress,
//       autocorrect: false,
//       obscureText: true,
//       decoration: BoxDecoration(
//         border: Border(
//             bottom: BorderSide(width: 1, color: CupertinoColors.inactiveGray)),
//       ),
//       placeholder: 'password',
//       onChanged: (_input) {
//         print(_input);
//         setState(() {
//           _password = _input;
//         });
//       },
//       onSubmitted: (_input) {
//         return _input.length != 0 ? null : print('Pls check lenght');
//       },
//     );
//   }

//   Widget _loginButton() {
//     return
//         // _auth.status == AuthStatus.Authenticating
//         //     ? Align(
//         //         alignment: Alignment.center,
//         //         child: CircularProgressIndicator(),
//         //       )
//         //     :
//         Container(
//       height: _altoScreen * 0.06,
//       width: _anchoScreen,
//       child: CupertinoButton.filled(
//         child: Text(
//           "LOGIN",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: CupertinoColors.white),
//         ),
//         onPressed: () {
//           print('Button Pressed');
//           if (_formKey.currentState.validate()) {
//             print('Valid stuff things');
//             _auth.loginUserWithEmailAndPassword(_email, _password);
//           }
//         },
//       ),
//     );
//   }

//   Widget _registerButton() {
//     return GestureDetector(
//       onTap: () {
//         //NavigationService.instance.navigateTo("register");
//         print('Este boton es para el registro');
//       },
//       child: Container(
//         height: _altoScreen * 0.06,
//         width: _anchoScreen,
//         child: CupertinoButton(
//           child: Text(
//             "REGISTER",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 color: CupertinoColors.white),
//           ),
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }
