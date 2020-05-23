import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Wrinkled/pages/fragments/fragment_home.dart';
import 'package:Wrinkled/pages/fragments/fragment_list.dart';
import 'fragments/fragment_games.dart';
import 'package:Wrinkled/style/theme.dart' as Style;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget fragmentChanger(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return FragmentHome();
      case 1:
        return FragmentGames();
        break;
      case 2:
        return FragmentList();
        break;
      default:
        return FragmentHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: fragmentChanger(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Style.Colors.titleColor,
          fixedColor: Style.Colors.secondColor,
          elevation: 40,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          backgroundColor: Style.Colors.mainColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                title: Text("Movies/Series"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.gamepad),
                title: Text("Games"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text("List"),
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
