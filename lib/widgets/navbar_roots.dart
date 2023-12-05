
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/info_screen.dart';

class Navbar_Roots extends StatefulWidget {
  const Navbar_Roots({super.key});

  @override
  State<Navbar_Roots> createState() => _Navbar_RootsState();
}

class _Navbar_RootsState extends State<Navbar_Roots> {
  int _selectedIndex = 0;
  final _screens = [
    //Orders Screen
    Home_Screen(),
    //My_OrdersScreen
    Info_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Color(0xff003248),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: "About us",
            ),
          ],
        ),
      ),
    );
  }
}
