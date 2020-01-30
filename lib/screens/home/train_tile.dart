import 'package:flutter/material.dart';
import 'package:flutter_with_firebase_training/models/train.dart';

class TrainTile extends StatelessWidget {

  final Train train;
  TrainTile({this.train});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[train.strength],
            ),
            title: Text(train.name),
            subtitle: Text('Takes ${train.sugars} sugars'),
          ),
      ),
    );
  }
}