class Movie {
  final int id;
  final String title;
  final String poster;
  final String cast;
  final String description;
  final String category;
  bool watched;
  double? rating;
  String? comment;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.cast,
    required this.description,
    required this.category,
    this.watched = false,
    this.rating,
    this.comment,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      poster: map['poster'],
      cast: map['cast'],
      description: map['description'],
      category: map['category'],
      watched: map['watched'],
      rating: map['rating']?.toDouble(),
      comment: map['comment'],
    );
  }
}
