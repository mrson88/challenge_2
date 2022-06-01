// To parse this JSON data, do
//
import 'package:flutter/services.dart';
import 'dart:convert';

var userJson = rootBundle.loadString('assets/datas/users.json');

Welcome welcomeFromJson(String userJson) =>
    Welcome.fromJson(json.decode(userJson));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.results,
  });

  List<Result> results;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.name,
    required this.email,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.status,
    required this.picture,
  });

  String name;
  String email;
  DateTime dob;
  DateTime registered;
  String phone;
  Status status;
  Picture picture;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        email: json["email"],
        dob: DateTime.parse(json["dob"]),
        registered: DateTime.parse(json["registered"]),
        phone: json["phone"],
        status: statusValues.map[json["status"]],
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "dob": dob.toIso8601String(),
        "registered": registered.toIso8601String(),
        "phone": phone,
        "status": statusValues.reverse[status],
        "picture": picture.toJson(),
      };
}

enum Gender { MALE, FEMALE }

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  String large;
  String medium;
  String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}

enum Status { OFFLINE, PRIVATE, ONLINE }

final statusValues = EnumValues({
  "offline": Status.OFFLINE,
  "online": Status.ONLINE,
  "private": Status.PRIVATE
});

EnumValues(Map<String, Status> map) {}
