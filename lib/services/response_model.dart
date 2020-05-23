import 'package:json_annotation/json_annotation.dart';

class ResponseModel {
  @JsonKey(name: "Search")
  List<Movie> search;

  ResponseModel(this.search);

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      (json['Search'] as List)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

class Movie {
  String title;
  String poster;
  String type;
  String year;
  String imdbID;

  Movie(this.title, this.poster, this.type, this.year, this.imdbID);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['Title'] as String,
      json['Poster'] as String,
      json['Type'] as String,
      json['Year'] as String,
      json['imdbID'] as String,
    );
  }
}
