// To parse this JSON data, do
//
//     final simpleList = simpleListFromJson(jsonString);

import 'dart:convert';

SimpleList simpleListFromJson(String str) => SimpleList.fromJson(json.decode(str));


class SimpleList {
    SimpleList({
      required this.success,
      required this.message,
      required this.data,
    });

    bool success;
    String message;
    List<dynamic> data;

    factory SimpleList.fromJson(Map<String, dynamic> json) => SimpleList(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );
    
}