import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/data/remote/movies_api/dto/movie_api_dto.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';
import 'package:movie_app/features/domain/entities/populars_entity.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'fe1d1f101631320e3348be72d56373f8';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];
  int _popularPage = 0;

  MoviesProvider() {
    print('Movies provider initialize');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }


  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage ++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularMovies.fromJson(jsonData);
    popularMovies = popularResponse.results;
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

}
