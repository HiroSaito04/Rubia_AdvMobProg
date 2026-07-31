import 'package:flutter/material.dart';

class FavoritesNotifier extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;
  int get totalFavorites => _favorites.length;

  void addFavorite(String movie) {
    if (!_favorites.contains(movie)) {
      _favorites.add(movie);
      notifyListeners();
    }
  }

  void removeFavorite(String movie) {
    _favorites.remove(movie);
    notifyListeners();
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}