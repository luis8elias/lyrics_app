import 'dart:convert';

GenericResponse genericResponseFromJson(String str) => GenericResponse.fromJson(json.decode(str));

String genericResponseToJson(GenericResponse data) => json.encode(data.toJson());

class GenericResponse {
    GenericResponse({
        required this.success,
        required this.message,
        this.data,
    });

    bool success;
    String message;
    dynamic data;

    factory GenericResponse.fromJson(Map<String, dynamic> json) => GenericResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
    };
}
