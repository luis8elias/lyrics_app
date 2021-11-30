import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));



class Genre {
    Genre({
      required  this.id,
      required  this.name,
      this.createdAt,
      this.updatedAt,
    });

    int id;
    String name;
    DateTime? createdAt;
    DateTime? updatedAt;

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

