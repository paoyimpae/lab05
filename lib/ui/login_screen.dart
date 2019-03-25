import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                  if (value.isEmpty) return "Password is required";
                }
              ),
              Row(children: <Widget>[
                Expanded(child: RaisedButton(
                  child: Text("Sign In"), onPressed: () {
                    auth.signInWithEmailAndPassword(
                      email: "paoyimpae2542@gmail.com", 
                      password: "12345678")
                    .then((FirebaseUser user) {
                      if(user.isEmailVerified) {
                        print("Go to Home Screen");
                      } else {
                        print("Please check E-mail to verify account.");
                      }
                    });
                  },
                ))
              ] 
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(child: Text("Register New User"), onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },)
                  ],
                )
                
            ],
          ),
        ),
      ),
    );
  }

}