import 'package:lyrics_app/domain/models/genre.dart';

class Lyric {
  Lyric({
    required this.id,
    required this.name,
    required this.lyric,
    required this.genreId,
    required this.groupId,
    required this.genre,
    this.updatedAt,
    this.createdAt,
  });

  int id;
  String name;
  String lyric;
  String genreId;
  String groupId;
  Genre genre;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory Lyric.fromJson(Map<String, dynamic> json) => Lyric(
        id: json["id"],
        name: json["name"],
        lyric: json["lyric"],
        genreId: json["genre_id"].toString(),
        groupId: json["group_id"].toString(),
        genre: Genre.fromJson(json["genre"]),
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : json["created_at"],
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : json["created_at"],
      );
}
