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
