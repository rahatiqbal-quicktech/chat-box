// To parse this JSON data, do
//
//     final loginUserModel = loginUserModelFromJson(jsonString);

import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  LoginUserModel({
    this.status,
    this.accessToken,
    this.tokenType,
    this.user,
  });

  bool? status;
  String? accessToken;
  String? tokenType;
  User? user;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        status: json["status"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.emoji,
    this.dob,
    this.gender,
    this.about,
    this.industry,
    this.jobTitle,
    this.company,
    this.living,
    this.ip,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.image6,
    this.otp,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic email;
  String? phone;
  dynamic emoji;
  String? dob;
  String? gender;
  dynamic about;
  dynamic industry;
  dynamic jobTitle;
  dynamic company;
  dynamic living;
  String? ip;
  String? image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  dynamic image5;
  dynamic image6;
  dynamic otp;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        emoji: json["emoji"],
        dob: json["dob"],
        gender: json["gender"],
        about: json["about"],
        industry: json["industry"],
        jobTitle: json["job_title"],
        company: json["company"],
        living: json["living"],
        ip: json["ip"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        image6: json["image6"],
        otp: json["otp"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "emoji": emoji,
        "dob": dob,
        "gender": gender,
        "about": about,
        "industry": industry,
        "job_title": jobTitle,
        "company": company,
        "living": living,
        "ip": ip,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "image6": image6,
        "otp": otp,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
