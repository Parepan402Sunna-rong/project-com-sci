import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:weatherlora/pages/home.dart';
import 'package:weatherlora/pages/weather2.dart';
import 'home.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class mainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainpageState();
  }
}

int num = 0;
var _currentIndex = 0;
//int index;

class Constants {
  static const String Weather1 = 'Weather 1';
  static const String Weather2 = 'Weather 2';

  static const List<String> choices = <String>[Weather1, Weather2];
}

// ignore: camel_case_types
class _mainpageState extends State<mainpage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        title: Text(
          'Weather Station',
          style: GoogleFonts.mali(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      backgroundColor: Color(0xFFF0F0F0),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.indigoAccent[700],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.indigo[400],
        height: 60,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 20, color: Colors.white),
          Icon(Icons.exit_to_app, size: 20, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: onTapped,
      ),
      body: getBodyWidget(),
    );
  }

  onTapped(int index) {
    setState(() {
      if (index == 1) {
        print(index);
        //_currentIndex = index;
        _popupDialog(context);
      } else {
        print("index : " + index.toString());
        _currentIndex = num;
      }
    });
  }

  getBodyWidget() {
    if (_currentIndex == 0) {
      return home();
    } else if (_currentIndex == 1) {
      return Container();
    } else if (_currentIndex == 2) {
      return weather2();
    }
  }

  void choiceAction(String choice) {
    if (choice == Constants.Weather1) {
      num = 0;
      _currentIndex = 0;
      //print(_currentIndex);
    } else if (choice == Constants.Weather2) {
      num = 2;
      _currentIndex = 2;
    }
    setState(() {});
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ต้องการออกจากแอพ !!!'),
            actions: <Widget>[
              FlatButton(onPressed: () => exit(0), child: Text('ใช่')),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                      final CurvedNavigationBarState navBarState =
                          _bottomNavigationKey.currentState;
                      navBarState.setPage(0);
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('ไม่')),
            ],
          );
        });
  }
}
