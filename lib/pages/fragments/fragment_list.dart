import 'package:flutter/material.dart';
import 'package:Wrinkled/pages/watch_list.dart';
import 'package:Wrinkled/services/movie_model.dart';

import 'package:Wrinkled/style/theme.dart' as Style;

class FragmentList extends StatefulWidget {
  @override
  _FragmentListState createState() => _FragmentListState();
}

class _FragmentListState extends State<FragmentList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch List"),
        centerTitle: true,
        backgroundColor: Style.Colors.mainColor,
      ),
      backgroundColor: Style.Colors.mainColor,
      body: movieList(WatchList.watchList),
    );
  }

  Widget movieList(List<MovieModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => _listCard(list[index], index),
    );
  }

  Widget _deleteBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget _listCard(MovieModel item, index) {
    return Dismissible(
        background: _deleteBg(),
        onDismissed: (direction) {
          setState(() {
            WatchList.watchList.removeWhere((element) =>
                element.title == item.title &&
                element.poster == item.poster &&
                element.year == item.year);
            WatchList.saveList();
          });
          _showSnackBar(context, item, index);
        },
        key: Key(item.imdbID),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Style.Colors.mainColor,
          elevation: 5,
          child: ListTile(
            leading: Image.network(
              item.poster,
            ),
            title: Text(
              item.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            subtitle: Column(children: <Widget>[
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 0),
                  Text("Type:  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  Text(item.type[0].toUpperCase() + item.type.substring(1),
                      style: TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 0),
                  Text("Year:  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  Text(item.year,
                      style: TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
            ]),
          ),
        ));
  }

  void _showSnackBar(context, MovieModel item, index) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('${item.title} is deleted'),
      action: SnackBarAction(
        label: "UNDO",
        textColor: Style.Colors.secondColor,
        onPressed: () {
          setState(() {
            WatchList.watchList.insert(index, item);
            WatchList.saveList();
          });
        },
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
