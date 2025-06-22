import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<int> _favoriteIds = [];

  List<int> get favoriteIds => _favoriteIds;

  FavoritesViewModel() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final storedIds = prefs.getStringList('favorites') ?? [];
    _favoriteIds = storedIds.map(int.parse).toList();
    notifyListeners();
  }

  Future<void> toggleFavorite(int productId) async {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favorites',
      _favoriteIds.map((id) => id.toString()).toList(),
    );
  }
}
