import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pos/screens/myclipper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<FirebaseUser> _validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        CircularProgressIndicator();
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print('signed in: ${user.uid}');
        print('User Name: ${user.displayName}');
        Navigator.pushNamed(context, '/Orders');
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Form(
            key: _formKey,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/pizza.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 50.0, bottom: 100.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "PizzApp",
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                "Tu Mejor Opcion",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Start of text fields

                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Correo Electronico",
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: 1.0,
                              color: Colors.grey.withOpacity(0.5),
                              margin: const EdgeInsets.only(
                                  left: 00.0, right: 10.0),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Ingresa Tu Nombre De Usuario',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Requirido' : null,
                                onSaved: (value) => _email = value,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Contraseña",
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              child: Icon(
                                Icons.lock_open,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: 1.0,
                              color: Colors.grey.withOpacity(0.5),
                              margin: const EdgeInsets.only(
                                  left: 00.0, right: 10.0),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Ingresa Tu Contraseña',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                obscureText: true,
                                validator: (value) =>
                                    value.isEmpty ? 'Requirido' : null,
                                onSaved: (value) => _password = value,
                              ),
                            )
                          ],
                        ),
                      ),

                      //End of text fields

                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        padding:
                            const EdgeInsets.only(left: 200.0, right: 200.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                splashColor: Colors.red,
                                color: Colors.red,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        "Iniciar",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Transform.translate(
                                      offset: Offset(15.0, 0.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(28.0)),
                                          splashColor: Colors.white,
                                          color: Colors.white,
                                          child: Icon(
                                            const IconData(0xea13,
                                                fontFamily: 'icomoon'),
                                            color: Colors.black,
                                          ),
                                          onPressed: () => _validateAndSubmit()
                                              .then((FirebaseUser user) =>
                                                  print(user))
                                              .catchError((e) => print(e)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () => _validateAndSubmit()
                                    .then((FirebaseUser user) => print(user))
                                    .catchError((e) => print(e)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
