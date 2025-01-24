import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Map<String, dynamic> movie;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movie = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie details',
          style: TextStyle(
            fontFamily: 'PlaywriteIN',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  movie['poster'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                movie['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Cast: ${movie['cast']}',
                style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
              ),
              const SizedBox(height: 8),
              Text(
                'Description: ${movie['description']}',
                style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
              ),
              const SizedBox(height: 8),
              Text(
                'Category: ${movie['category']}',
                style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
              ),
              const SizedBox(height: 20),

              if (movie['rating'] != null) ...[
                const Text(
                  'Your Rating:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < movie['rating']
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.amber,
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Text(
                  'Comment: ${movie['comment']}',
                  style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                const SizedBox(height: 20),
              ],

              if (movie['rating'] == null)
                ElevatedButton(
                  onPressed: () async {
                    final updatedMovie = await Navigator.pushNamed(
                      context,
                      '/rating',
                      arguments: movie,
                    );

                    if (updatedMovie != null) {
                      setState(() {
                        movie = updatedMovie as Map<String, dynamic>;
                      });
                    }
                  },
                  child: const Text(
                    'Rate Movie',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
