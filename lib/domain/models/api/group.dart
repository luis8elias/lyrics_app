class Group {
    Group({
      required  this.id,
      required  this.name,
      required  this.code,
      required this.adminId,
    });

    int id;
    String name;
    String code;
     int adminId;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        adminId: json["admin_id"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
    };
}
