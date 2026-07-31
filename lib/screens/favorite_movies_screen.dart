import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Consumer<FavoritesNotifier>(
        builder: (context, favoritesNotifier, child) {


          //PAG WALANG LAMAN 
          if (favoritesNotifier.favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorite movies added yet.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          //DISPLAY NG COUNTER
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total Favorite Movies: ${favoritesNotifier.totalFavorites}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: favoritesNotifier.favorites.length,
                  itemBuilder: (context, index) {
                    final movie = favoritesNotifier.favorites[index];

                    return ListTile(
                      title: Text(movie),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                        
                           Provider.of<FavoritesNotifier>(context, listen: false)
                          .removeFavorite(movie);
                          
                        },
                      ),
                    );
                  },
                ),
              ),


              //CLEAR BUTTON PROVIDER.OF 
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Clear all favorites from state
                    favoritesNotifier.clearFavorites();
                  },
                  child: const Text('Clear All Favorites'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}