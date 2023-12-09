part of './models.dart';

class UserClass {
  String? nama;
  String? email;
  List<dynamic>? genres;
  List<dynamic>? langs;
  String? profile;
  int? wallet;

  UserClass(
      {required this.nama,
      required this.email,
      required this.genres,
      required this.langs,
      required this.profile,
      required this.wallet});
}
