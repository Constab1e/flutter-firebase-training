import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_with_firebase_training/models/train.dart';

class DatabaseService{
  final String uid;

  DatabaseService({this.uid});
  //collection reference

  final CollectionReference trainCollection = Firestore.instance.collection('tests');

  Future updateUserData(String sugars, String name, int strength) async {
    return await trainCollection.document(uid).setData({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength,
    });
  }

  //train list from a snapshot

  List<Train> _trainListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Train(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Train>> get trains {
    return trainCollection.snapshots()
    .map(_trainListFromSnapshot);
  }
}