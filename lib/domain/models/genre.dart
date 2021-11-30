
import 'package:hive/hive.dart';
part 'hive_adapters/genre.g.dart';

@HiveType(typeId: 1)
class Genre {
   
    @HiveField(0)
    int id;
    @HiveField(1)
    String name;
    @HiveField(2)
    DateTime? createdAt;
    @HiveField(3)
    DateTime? updatedAt;

     Genre({
      required  this.id,
      required  this.name,
      this.createdAt,
      this.updatedAt,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        createdAt:json["created_at"]!= null ? DateTime.parse(json["created_at"]) : json["created_at"],
        updatedAt:json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

