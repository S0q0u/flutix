part of './services.dart';

class Api {
  static Future<List<Film>> _getFilms() async {
    var api = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=0b026f86ca43fb4838eaf8830235604a&language=en-US");
    final response =
        await http.get(api, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final genreMap = await _getGenreMap();
      final List<dynamic> results = body['results'];
      return results
          .map(
            (json) => Film.fromJson(json, genreMap),
          )
          .toList();
    } else {
      throw Exception('Failed to load films');
    }
  }

  static Future<List<Film>> _getComingSoon() async {
    var api = Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=0b026f86ca43fb4838eaf8830235604a&language=en-US");
    final response =
        await http.get(api, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final genreMap = await _getGenreMap();
      final List<dynamic> results = body['results'];
      return results
          .map(
            (json) => Film.fromJson(json, genreMap),
          )
          .toList();
    } else {
      throw Exception('Failed to load films');
    }
  }

  static Future<Map<int, String>> _getGenreMap() async {
    final genreApiUrl = Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=0b026f86ca43fb4838eaf8830235604a&language=en-US');
    final response = await http.get(genreApiUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List<dynamic> genres = body['genres'];

      // Create a map of genre IDs to genre names
      final Map<int, String> genreMap = {};
      for (final genre in genres) {
        final int id = genre['id'];
        final String name = genre['name'];
        genreMap[id] = name;
      }
      return genreMap;
    } else {
      throw Exception('Failed to load genres');
    }
  }

  static Future<List<Cast>> getCastList(String movieId) async {
    try {
      var api = Uri.parse(
          "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=0b026f86ca43fb4838eaf8830235604a");
      final response =
          await http.get(api, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);

        // Extract the cast information directly from the response
        final List<dynamic> castList = body['cast'];

        // Parse the cast information into a List<Cast>
        final List<Cast> castData =
            castList.map((json) => Cast.fromJson(json)).toList();

        return castData;
      } else {
        throw Exception('Failed to load cast information');
      }
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  static Future<List<Film>> get futureData => _getFilms();
  static Future<List<Film>> get futureDataSoon => _getComingSoon();
}
