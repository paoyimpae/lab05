import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String password = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register new user"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "E-mail is required";
                }
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',        
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  password = value;
                  if (value.isEmpty && value.length < 8) return "Password is required";
                }
              ),
               TextFormField(
                decoration: InputDecoration(
                  labelText: 'Repeat Password',        
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty && value.length < 8) return "Password is required";
                  else if (value != password) return "Password must be same";
                }
              ),
              Row(children: <Widget>[
                Expanded(child: RaisedButton(
                  child: Text("Register"), onPressed: () {
                    // _formKey.currentState.validate();
                    auth
                    .createUserWithEmailAndPassword(email: "paoyimpae2542@gmail.com", password: "12345678")
                    .then((FirebaseUser user) {
                      user.sendEmailVerification();
                      print("returm from firebase ${user.email}");
                    }).catchError((error) {
                      print("$error");}
                    );
                  },
                ))
              ] 
              ),        
            ],
          ),
        ),
      ),
    );
  }

}
