import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0; // Initial rating value
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rate movie',
          style: TextStyle(
            fontFamily: 'PlaywriteIN',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

            const Text(
              'Rate this movie:',
              style: TextStyle(fontSize: 18),
            ),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 40,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 16),

            const Text(
              'Leave a comment:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _commentController,
              maxLines: 3,
              style: const TextStyle(
                fontFamily: 'Roboto',
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your comment here...',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto'
                )
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_rating > 0) {
                  movie['rating'] = _rating;
                  movie['comment'] = _commentController.text;

                  Navigator.pop(context, movie);
                }
              },
              child: const Text('Submit Rating',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
