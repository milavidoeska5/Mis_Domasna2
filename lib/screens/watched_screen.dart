import 'package:flutter/material.dart';

class WatchedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> watchedMovies;

  const WatchedScreen({Key? key, required this.watchedMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watched Movies',
          style: TextStyle(fontFamily: 'PlaywriteIN', fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: watchedMovies.length,
        itemBuilder: (context, index) {
          final movie = watchedMovies[index];
          return ListTile(
            leading: Image.asset(movie['poster']),
            title: Text(movie['title'], style: TextStyle(fontFamily: 'Roboto'),),
            subtitle: Text(movie['category']),
          );
        },
      ),
    );
  }
}
