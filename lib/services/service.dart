import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Wrinkled/services/movie_model.dart';
import 'package:Wrinkled/services/response_model.dart';

class Service {
  static const apiKey = "39a81601";

  static Future<List<MovieModel>> getMovies(String search) async {
    String url = "http://www.omdbapi.com/?apikey=$apiKey&s=$search";

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<MovieModel> movies =
            ResponseModel.fromJson(json.decode(response.body))
                .search
                .map((movie) => MovieModel.fromResponse(movie))
                .toList();
        return movies;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e).toString();
    }
  }
}
