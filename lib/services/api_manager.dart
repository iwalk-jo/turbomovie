import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turbomovie_app/model/movies_config.dart';
import 'package:turbomovie_app/model/moviesinfo.dart';

class APIManager {
  Future<Welcome> getMovies() async {
    var client = http.Client();
    var welcome;

    try {
      var response = await client.get(MoviesConfig.movies_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        welcome = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return welcome;
    }
    {
      return welcome;
    }
  }
}
