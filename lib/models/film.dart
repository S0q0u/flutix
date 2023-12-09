part of './models.dart';

class Film {
  int? id;
  String? title;
  String? desc;
  List<String>? genres;
  String? thumbnailUrl;
  String? backdropUrl;
  double? rating; // Add the rating field

  Film(
      {required this.title,
      required this.genres,
      required this.thumbnailUrl,
      required this.backdropUrl,
      required this.rating});

  Film.fromJson(Map<String, dynamic> json, Map<int, String> genreMap) {
    id = json['id'];
    title = json['title'];
    desc = json['overview'];
    backdropUrl = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}";
    thumbnailUrl = "https://image.tmdb.org/t/p/w500${json['poster_path']}";
    rating = json['vote_average']?.toDouble() / 2;

    final List<dynamic>? genreIds = json['genre_ids'];
    if (genreIds != null && genreIds.isNotEmpty) {
      // Fetch genre names using the provided genre map
      genres = _fetchGenreNames(genreIds, genreMap);
    } else {
      genres = null;
    }
  }

  List<String>? _fetchGenreNames(
      List<dynamic> genreIds, Map<int, String> genreMap) {
    return genreIds.map((id) => genreMap[id] ?? 'Unknown').toList();
  }
}
