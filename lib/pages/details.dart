import 'package:flutter/material.dart';
import 'package:Wrinkled/pages/watch_list.dart';
import 'package:Wrinkled/services/movie_model.dart';
import 'package:Wrinkled/style/theme.dart' as Style;

class MovieDetails extends StatefulWidget {
  final MovieModel currMovie;
  MovieDetails({@required this.currMovie});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style.Colors.mainColor,
        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/resim_yok.png",
                      image: widget.currMovie.poster,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.currMovie.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 17),
                          Text("Type:  ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic)),
                          Text(
                              widget.currMovie.type[0].toUpperCase() +
                                  widget.currMovie.type.substring(1),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 17),
                          Text(
                            "Year:   ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(widget.currMovie.year,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: Style.Colors.mainColor,
                        elevation: 3,
                        highlightColor: Style.Colors.secondColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Go Back',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      buttonChoice(widget.currMovie),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )));
  }

  Widget buttonChoice(MovieModel item) {
    if (WatchList.watchList
        .where((element) =>
            element.title == item.title &&
            element.poster == item.poster &&
            element.year == item.year)
        .isEmpty) {
      return Flexible(
        child: RaisedButton(
          color: Style.Colors.mainColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            WatchList.addToList(item);
            WatchList.saveList();
            setState(() {});
          },
          child: Text('Add to List',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
          highlightColor: Style.Colors.secondColor,
        ),
      );
    } else {
      return Flexible(
        child: RaisedButton(
          color: Style.Colors.mainColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            WatchList.watchList.removeWhere((element) =>
                element.title == item.title &&
                element.poster == item.poster &&
                element.year == item.year);
            setState(() {});
            WatchList.saveList();
          },
          child: Text('Remove from List',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
          highlightColor: Style.Colors.secondColor,
        ),
      );
    }
  }
}
