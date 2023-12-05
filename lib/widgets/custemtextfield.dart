
import 'package:flutter/material.dart';

class custemtextfiel extends StatelessWidget {
  custemtextfiel(
      {super.key, required this.controlername, required this.valueController});
  final String controlername;

  final valueController;

  //String value=valueController.text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            controller: valueController,
            decoration: InputDecoration(
                label: Text(
                  controlername,
                  style: TextStyle(color: Colors.white),
                ),
                filled: true,
                fillColor: Color.fromARGB(118, 7, 61, 138),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0x8e7a7b8c),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
