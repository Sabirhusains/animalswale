// To parse this JSON data, do
//
//     final filterPostModel = filterPostModelFromJson(jsonString);

import 'dart:convert';

import '../dashboard/dashboard_model.dart';


FilterPostModel filterPostModelFromJson(String str) => FilterPostModel.fromJson(json.decode(str));

String filterPostModelToJson(FilterPostModel data) => json.encode(data.toJson());

class FilterPostModel {
  String? success;
  String? message;
  List<Post>? data;

  FilterPostModel({
    this.success,
    this.message,
    this.data,
  });

  factory FilterPostModel.fromJson(Map<String, dynamic> json) => FilterPostModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
