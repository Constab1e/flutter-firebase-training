import 'package:flutter/material.dart';
import 'package:flutter_with_firebase_training/screens/authenticate/authenticate.dart';
import 'package:flutter_with_firebase_training/models/user.dart';
import 'home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    

    //return eight home or authenticate widget
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}