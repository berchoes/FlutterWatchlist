import 'package:Wrinkled/services/response_model.dart';

class MovieModel {
  String title;
  String poster;
  String type;
  String year;
  String imdbID;

  MovieModel({this.title, this.poster, this.type, this.year, this.imdbID});

  MovieModel.fromResponse(Movie response)
      : title = response.title,
        poster = response.poster,
        type = response.type,
        year = response.year,
        imdbID = response.imdbID;

  Map toJson() => {
        'Title': this.title,
        'Poster': this.poster,
        'Type': this.type,
        'Year': this.year,
        'imdbID': this.imdbID
      };
}
