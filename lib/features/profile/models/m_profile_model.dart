// To parse this JSON data, do
//
//     final mProfileModel = mProfileModelFromJson(jsonString);

import 'dart:convert';

MProfileModel mProfileModelFromJson(String str) =>
    MProfileModel.fromJson(json.decode(str));

String mProfileModelToJson(MProfileModel data) => json.encode(data.toJson());

class MProfileModel {
  MProfileModel({
    this.id,
    this.name,
    this.number,
    this.aboutMe,
    this.password,
    this.nidCard,
    this.profilePic,
    this.permanentAddress,
    this.educationalStatus,
    this.familyMember,
    this.homeDistricts,
    this.monthlyIncome,
    this.height,
    this.color,
    this.presentAddress,
    this.workType,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.interested,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic number;
  dynamic aboutMe;
  String? password;
  dynamic nidCard;
  dynamic profilePic;
  dynamic permanentAddress;
  dynamic educationalStatus;
  dynamic familyMember;
  dynamic homeDistricts;
  dynamic monthlyIncome;
  dynamic height;
  dynamic color;
  dynamic presentAddress;
  dynamic workType;
  dynamic image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  dynamic interested;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MProfileModel.fromJson(Map<String, dynamic> json) => MProfileModel(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        aboutMe: json["about_me"],
        password: json["password"],
        nidCard: json["nid_card"],
        profilePic: json["profile_pic"],
        permanentAddress: json["permanent_address"],
        educationalStatus: json["educational_status"],
        familyMember: json["family_member"],
        homeDistricts: json["home_districts"],
        monthlyIncome: json["monthly_income"],
        height: json["height"],
        color: json["color"],
        presentAddress: json["present_address"],
        workType: json["work_type"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        interested: json["interested"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "about_me": aboutMe,
        "password": password,
        "nid_card": nidCard,
        "profile_pic": profilePic,
        "permanent_address": permanentAddress,
        "educational_status": educationalStatus,
        "family_member": familyMember,
        "home_districts": homeDistricts,
        "monthly_income": monthlyIncome,
        "height": height,
        "color": color,
        "present_address": presentAddress,
        "work_type": workType,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "interested": interested,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
