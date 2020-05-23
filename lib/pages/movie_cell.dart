import 'package:Wrinkled/services/movie_model.dart';
import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final MovieModel movie;
  const MovieCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FadeInImage.assetNetwork(
              placeholder: "images/no_image.png",
              image: movie.poster ?? "assets/resim_yok.png",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Text(
              movie.title,
              maxLines: 2,
              //softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
