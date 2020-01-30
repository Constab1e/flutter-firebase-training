import 'package:flutter/material.dart';
import 'package:flutter_with_firebase_training/services/auth.dart';
import 'package:flutter_with_firebase_training/shared/constants.dart';
import 'package:flutter_with_firebase_training/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  bool isLoading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return isLoading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign up"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Log In"),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long': null,
                obscureText: true,
                onChanged: (val){
                setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text("Register",
                style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                   setState(() => isLoading = true);
                   dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                   if(result == null){
                     setState(() => error = 'please enter valid data');
                     isLoading = false;
                   }else{

                   }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
            ],
          ),
        ))
    );
  }
}