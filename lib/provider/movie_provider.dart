import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

final List<MovieModel> initialList = List.generate(
    15,
    (index) => MovieModel(
        minutes: Random().nextInt(100) + 60, title: "My Movie $index"));

class MovieProvider with ChangeNotifier {
  //Initial List + Getter
  final List<MovieModel> _movies = initialList;

  List<MovieModel> get movies => _movies;

  //Favorites list + Getter
  final List<MovieModel> _myList = []; //but why final?
  List<MovieModel> get myList => _myList;

  void addToList(MovieModel movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromList(MovieModel movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
