import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/custembutten.dart';
import '../widgets/custemtextfield.dart';
import '../widgets/getter.dart';

class Home_Screen extends StatefulWidget {
   Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Screen> {
  TextEditingController _controllerp=TextEditingController();
  TextEditingController _controlleri=TextEditingController();
  TextEditingController _controllerd=TextEditingController();
void getvalues(){
  print(_controllerp.text);
  print(_controlleri.text);
  print(_controllerd.text);
}
  final ref = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unused_local_variable
    var _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        
        final TimeOfDay? nowTime = TimeOfDay.now();
        
        String? instantTime = nowTime?.format(context);
        //print(instantTime);
        print(instantTime);
        String? time = getSelectedTime();
        print(time);
        if (time==instantTime) {
          ref.child('play').set({
            'play':1,

          }

          );
          timer.cancel();
        } else {
          print('false');
        }
      },
    );
    
  }

  String? _selectedTime;

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {

        _selectedTime = result.format(context);
        setSelectedTime(_selectedTime);
        print(_selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003248),
        title: Text(
          'Time',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.alarm,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.alarm,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            custemtextfiel(controlername: 'Kp', valueController: _controllerp,),
            SizedBox(height: 20,),custemtextfiel(controlername: 'Ki', valueController: _controlleri,),
            SizedBox(height: 20,),custemtextfiel(controlername: 'Kd', valueController: _controllerd,),
            SizedBox(height: 35,),
              Text(
                _selectedTime != null ? _selectedTime! : 'No time selected!',
                style: const TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(150, 60),
                    primary: Color(0xff003248),
                  ),
                  onPressed: _show,
                  child: const Text(
                    'Choose time',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  SizedBox(height: 35,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              butten(buttonname: 'Play', onPressed: () {
                ref.child('play').set({
               'play':1,
              }
              ); },)
              ,butten(buttonname: 'Stop', onPressed: () {   ref.child('play').set({
                      'play':0,
                    });
                },),
              butten(buttonname: 'Update PID values', onPressed: () {
                ref.child('control').set({
                  'Kp': "${_controllerp.text}",
                  'Ki':  "${_controlleri.text}",
                  'Kd': "${_controllerd.text}",
                }
                );
                },)],)
            ],
          ),
        ),
      ),
    );
  }
}
