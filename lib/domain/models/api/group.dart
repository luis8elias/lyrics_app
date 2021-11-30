class Group {
    Group({
      required  this.id,
      required  this.name,
      required  this.code,
    });

    int id;
    String name;
    String code;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
    };
}
