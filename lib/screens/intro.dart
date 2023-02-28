import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/favourite.dart';
import 'package:news/screens/homepage.dart';
import 'package:news/screens/location.dart';
import 'package:news/screens/profile.dart';

import '../helpers/constants.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int selectedIndex = 0;

  void navBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = const [
    HomePage(),
    Favourites(),
    Location(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.black,
        inactiveColor: Colors.grey.shade500,
        currentIndex: selectedIndex,
        iconSize: 26,
        onTap: navBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.heart_fill,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.compass_fill,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_fill,
              ),
              label: ''),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
