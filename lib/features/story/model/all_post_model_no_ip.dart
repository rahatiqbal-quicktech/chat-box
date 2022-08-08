// To parse this JSON data, do
//
//     final allPostsModelNoIp = allPostsModelNoIpFromJson(jsonString);

import 'dart:convert';

List<AllPostsModelNoIp> allPostsModelNoIpFromJson(String str) =>
    List<AllPostsModelNoIp>.from(
        json.decode(str).map((x) => AllPostsModelNoIp.fromJson(x)));

String allPostsModelNoIpToJson(List<AllPostsModelNoIp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPostsModelNoIp {
  AllPostsModelNoIp({
    this.id,
    this.userId,
    this.caption,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? userId;
  String? caption;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AllPostsModelNoIp.fromJson(Map<String, dynamic> json) =>
      AllPostsModelNoIp(
        id: json["id"],
        userId: json["user_id"],
        caption: json["caption"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "caption": caption,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
