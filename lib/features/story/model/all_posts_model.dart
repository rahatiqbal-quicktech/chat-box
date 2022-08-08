// To parse this JSON data, do
//
//     final allPostsModel = allPostsModelFromJson(jsonString);

import 'dart:convert';

List<AllPostsModel> allPostsModelFromJson(String str) =>
    List<AllPostsModel>.from(
        json.decode(str).map((x) => AllPostsModel.fromJson(x)));

String allPostsModelToJson(List<AllPostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPostsModel {
  AllPostsModel({
    this.id,
    this.userId,
    this.caption,
    // this.ip,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? userId;
  String? caption;
  // String? ip;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AllPostsModel.fromJson(Map<String, dynamic> json) => AllPostsModel(
        id: json["id"],
        userId: json["user_id"],
        caption: json["caption"],
        // ip: json["ip"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "caption": caption,
        // "ip": ip,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
