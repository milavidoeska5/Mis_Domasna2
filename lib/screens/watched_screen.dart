import 'package:flutter/material.dart';

class WatchedScreen extends StatelessWidget {
  const WatchedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchedMovies = ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watched Movies',
        style: TextStyle(fontFamily: 'PlaywriteIN', fontSize: 24),),
      ),
      body: ListView.builder(
        itemCount: watchedMovies.length,
        itemBuilder: (context, index) {
          final movie = watchedMovies[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: movie,
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        movie['poster'],
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        movie['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
