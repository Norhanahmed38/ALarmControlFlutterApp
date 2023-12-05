import 'package:flutter/material.dart';

class butten extends StatelessWidget {
  const butten({super.key, required this.buttonname, required this.onPressed});
  final String buttonname;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xff003248), borderRadius: BorderRadius.circular(15)),
        height: 60,
        width: 110,
        child: TextButton(
            onPressed: onPressed,
            child: Text(buttonname, style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),));
  }
}
