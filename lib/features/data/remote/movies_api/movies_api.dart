import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/data/remote/movies_api/dto/movie_api_dto.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'fe1d1f101631320e3348be72d56373f8';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('Movies provider initialize');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[10].title );
    this.onDisplayMovies = nowPlayingResponse.results;
  }
}
