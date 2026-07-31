import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import 'favorite_movies_screen.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  final List<String> movies = const [
    'Spider-Man',
    'Inception',
    'Interstellar',
    'The Dark Knight',
    'Avatar',
    'The Matrix',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteMoviesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      // Use Consumer to listen for updates in the favorites state
      body: Consumer<FavoritesNotifier>(
        builder: (context, favoritesNotifier, child) {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              // 1. Check if the current movie is already in favorites
              final bool isFavorite = favoritesNotifier.favorites.contains(movie);

              return ListTile(
                title: Text(movie),
                trailing: IconButton(
                  // 2. Visual Indicator: Filled red heart if added, outline heart if not
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  // 3. Disable button (null) if already added so it can only be clicked once
                  onPressed: isFavorite
                      ? null
                      : () {
                          favoritesNotifier.addFavorite(movie);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$movie added to favorites!'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                ),
              );
            },
          );
        },
      ),
    );
  }
}