import 'package:flutter/material.dart';
import 'package:flutter_with_firebase_training/models/train.dart';
import 'package:flutter_with_firebase_training/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_with_firebase_training/services/database.dart';
import 'package:flutter_with_firebase_training/screens/home/train_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Train>>.value(
      value: DatabaseService().trains,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: TrainList(),
      ),
    );
  }
}