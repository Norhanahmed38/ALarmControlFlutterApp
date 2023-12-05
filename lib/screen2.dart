import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
class Home extends StatelessWidget {
  Home({super.key});
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: writeData,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
  void writeData(){
    ref.child('control').set({
      'Play': 'a',
      'Kp': 15,
      'Ki': 15,
      'Kd': 15,
    });
  }
}