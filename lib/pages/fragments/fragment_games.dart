import 'package:Wrinkled/pages/details.dart';
import 'package:Wrinkled/services/movie_model.dart';
import 'package:Wrinkled/services/service.dart';
import 'package:flutter/material.dart';
import 'package:Wrinkled/style/theme.dart' as Style;
import '../movie_cell.dart';

class FragmentGames extends StatefulWidget {
  @override
  _FragmentGamesState createState() => _FragmentGamesState();
}

class _FragmentGamesState extends State<FragmentGames> {
  final _searchController = TextEditingController();
  Icon _customIcon = Icon(Icons.search);
  Widget _customSearchBar = Text("Games");
  String searchText = "Assassin's Creed";

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Style.Colors.secondColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        actions: <Widget>[
          IconButton(
            icon: _customIcon,
            color: Style.Colors.secondColor,
            onPressed: () {
              setState(() {
                if (this._customIcon.icon == Icons.search) {
                  this._customIcon = Icon(Icons.cancel);
                  this._customSearchBar = Theme(
                      data: ThemeData(
                          primaryColor: Colors.white,
                          cursorColor: Colors.white),
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        controller: _searchController,
                        onChanged: (text) {
                          setState(() {});
                        },
                      ));
                } else {
                  this._customIcon = Icon(Icons.search);
                  this._customSearchBar = Text("Games");
                }
              });
            },
          ),
          SizedBox(width: 20)
        ],
        title: _customSearchBar,
        centerTitle: true,
        backgroundColor: Style.Colors.mainColor,
      ),
      backgroundColor: Style.Colors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 2),
          widgetChoice(_searchController),
        ],
      ),
    );
  }

  Widget widgetChoice(var controller) {
    if (controller.text.isEmpty || _customIcon.icon == Icons.search) {
      controller.clear();
      return defaultMovies();
    } else
      return searchedMovies(controller.text);
  }

  Widget defaultMovies() {
    return Flexible(
        child: FutureBuilder<List<MovieModel>>(
      future: Service.getMovies(searchText),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
              child: Text(
            "No Games Found :(",
            style: TextStyle(color: Style.Colors.titleColor),
          ));
        } else if (snapshot.hasData) {
          return gridViewGames(snapshot);
        }
        return circularProgress();
      },
    ));
  }

  Widget searchedMovies(String search) {
    return Flexible(
        child: FutureBuilder<List<MovieModel>>(
      future: Service.getMovies(search),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
              child: Text(
            "No Games Found :(",
            style: TextStyle(color: Style.Colors.titleColor),
          ));
        } else if (snapshot.hasData) {
          return gridViewGames(snapshot);
        }
        return circularProgress();
      },
    ));
  }

  goToDetailsPage(BuildContext context, MovieModel movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (BuildContext context) => MovieDetails(currMovie: movie),
      ),
    );
  }

  Widget gridViewGames(AsyncSnapshot<List<MovieModel>> snapshot) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.60,
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          children:
              snapshot.data.where((element) => element.type == "game").map(
            (movie) {
              return GestureDetector(
                child: SafeArea(child: GridTile(child: MovieCell(movie))),
                onTap: () {
                  goToDetailsPage(context, movie);
                },
              );
            },
          ).toList(),
        ));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
