import 'package:Wrinkled/pages/watch_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Wrinkled/pages/fragments/fragment_home.dart';
import 'package:Wrinkled/pages/fragments/fragment_list.dart';
import 'package:google_fonts/google_fonts.dart';
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
  void initState() {
    WatchList.loadList();
    super.initState();
  }

  Future<bool> _backPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Style.Colors.mainColor,
              title: Text("Do you really want to quit?",
                  style: GoogleFonts.overpass(color: Colors.white)),
              actions: <Widget>[
                FlatButton(
                  child: Text("No",
                      style: GoogleFonts.overpass(color: Colors.white)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Yes",
                      style: GoogleFonts.overpass(color: Colors.white)),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _backPressed,
        child: Scaffold(
          body: fragmentChanger(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Style.Colors.titleColor,
            fixedColor: Style.Colors.secondColor,
            elevation: 40,
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            backgroundColor: Style.Colors.mainColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.theaters),
                  title: Text(
                    "Movies/Series",
                    style: GoogleFonts.overpass(),
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.gamepad),
                  title: Text("Games", style: GoogleFonts.overpass()),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text("List", style: GoogleFonts.overpass()),
                  backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
