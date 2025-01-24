import 'package:flutter/material.dart';
import '../data/movies_data.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> watchedMovies = [];

  void toggleWatchedStatus(Map<String, dynamic> movie) {
    setState(() {
      if (watchedMovies.contains(movie)) {
        watchedMovies.remove(movie);
      } else {
        watchedMovies.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            fontFamily: 'PlaywriteIN',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/watched',
                arguments: watchedMovies,
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: movies[index],
              );
            },
            onWatchToggle: () {
              toggleWatchedStatus(movies[index]);
            },
          );
        },
      ),
    );
  }
}
