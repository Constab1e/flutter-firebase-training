import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_with_firebase_training/models/train.dart';
import 'package:flutter_with_firebase_training/screens/home/train_tile.dart';

class TrainList extends StatefulWidget {
  @override
  _TrainListState createState() => _TrainListState();
}

class _TrainListState extends State<TrainList> {
  @override
  Widget build(BuildContext context) {

    final trains = Provider.of<List<Train>>(context);
    //print(trains.documents);
    trains.forEach((trains) {
      print(trains.name);
      print(trains.strength);
      print(trains.sugars);
    });
    return ListView.builder(
      itemCount: trains.length,
      itemBuilder: (context, index){
        return TrainTile(train: trains[index]);
      },
    
    );
  }
}