part of './models.dart';

class Cast {
  String? name;
  String? picture;

  Cast({
    this.name,
    this.picture,
  });

  // Add a constructor to parse data from JSON
  Cast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    // Assuming the image URL is available in the 'profile_path' field
    picture = json['profile_path'] != null
        ? "https://image.tmdb.org/t/p/w500${json['profile_path']}"
        : null;
  }
}
