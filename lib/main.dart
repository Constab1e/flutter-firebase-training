import 'package:flutter/material.dart';
import 'package:flutter_with_firebase_training/screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper());
  }
}