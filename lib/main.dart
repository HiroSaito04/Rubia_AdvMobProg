import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/movie_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Favorites App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MovieListScreen(),
    );
  }
}