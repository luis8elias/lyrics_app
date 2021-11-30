import 'package:hive/hive.dart';
import 'package:lyrics_app/domain/models/genre.dart';

part 'hive_adapters/lyric.g.dart';

@HiveType(typeId: 2)
class Lyric {
 
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String lyric;
  @HiveField(3)
  String genreId;
  @HiveField(4)
  String groupId;
  @HiveField(5)
  Genre genre;
  @HiveField(6)
  DateTime? updatedAt;
  @HiveField(7)
  DateTime? createdAt;


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
