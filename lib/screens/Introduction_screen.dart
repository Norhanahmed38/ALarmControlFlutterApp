

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../widgets/navbar_roots.dart';



class Introduction_Screen extends StatelessWidget {
  Introduction_Screen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Welcome To Our Project',
        body:
            'our project is called mutemotion, has some features tap to see it in next pages',
        image: Center(
          child: Image.asset('assets/images/1.jpg',),
        ),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xff003248),
        ),
        bodyTextStyle: TextStyle(color: Colors.black54,fontSize: 18)
        ),),
      PageViewModel(
        title: 'Line Follower Robot',
        body: 'It uses PID control algorithm to make its turns with a steady speed without oscillation or errors',
        image: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Image.asset('assets/images/2.jpg',),
          ),
        ),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xff003248),
        ),
        bodyTextStyle: TextStyle(color: Colors.black54,fontSize: 18)
        )),
        PageViewModel(
        title: 'An Alarm',
        body:
            'it is an alarm that turns on and starts moving in a line only when you set the time for it making waking up in the morning fun for everyone',
        image: Center(
          child: Image.asset('assets/images/3.jpg'),
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xff003248),
        ),
        bodyTextStyle: TextStyle(color: Colors.black54,fontSize: 18)
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:150.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: Size(10, 10),
            color: Colors.black54,
            activeSize: Size.square(15),
            activeColor: Color(0xff003248),
          ),
          showDoneButton: true,
          done: Text(
            'Done',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff003248),
            ),
          ),
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff003248),
            ),
          ),
          showNextButton: true,
          next: Icon(
            Icons.arrow_forward,
            size: 30,
            color:Color(0xff003248),
          ),
          onDone: () => onDone(context),
        ),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Navbar_Roots()));
  }
}
