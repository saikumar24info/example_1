// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: AddData(),
    );
  }
}

class AddData extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection("globe");
  Future<void> addUser() {
    return users
        .doc("subject")
        .set({
          "FirstLanguage": "Telugu",
          "secondLanguage": "Hindi",
          "thirdLanguage": "English"
        })
        .then((value) => print("value is added successfully"))
        .catchError((error) => print(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Example"),
      ),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            addUser();
          },
        ),
      ),
    );
  }
}
