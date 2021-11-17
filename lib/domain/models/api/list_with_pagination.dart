// To parse this JSON data, do
//
//     final listWithPagination = listWithPaginationFromJson(jsonString);

import 'dart:convert';

import 'package:lyrics_app/domain/models/api/pagination.dart';

ListWithPagination listWithPaginationFromJson(String str) => ListWithPagination.fromJson(json.decode(str));

String listWithPaginationToJson(ListWithPagination data) => json.encode(data.toJson());

class ListWithPagination {
    ListWithPagination({
      required  this.success,
      required  this.message,
      required  this.data,
      this.pagination,
    });

    bool success;
    String message;
    List<dynamic> data;
    Pagination? pagination;

    factory ListWithPagination.fromJson(Map<String, dynamic> json) => ListWithPagination(
        success: json["success"],
        message: json["message"],
        data: json["data"],
        pagination: json["pagination"] != null ? Pagination.fromJson(json["pagination"]) : json["pagination"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
    };
}
