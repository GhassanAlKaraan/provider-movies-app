import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'movie_model.dart';

final List<MovieModel> initialList = List.generate(
    10,
    (index) => MovieModel(
        minutes: Random().nextInt(100) + 60, title: "my movie $index"));

class MovieProvider with ChangeNotifier{
  final List<MovieModel> _movies = initialList;
  List<MovieModel> get movies=> _movies;

}