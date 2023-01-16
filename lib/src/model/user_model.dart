// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.email,
    this.password,
    this.nameLastname,
    this.genders = 0,
    this.provinces,
    this.amphures,
    this.tambons,
    this.imageprofile,
    this.status = 1,
  });

  String? id;
  String? email;
  String? password;
  String? nameLastname;
  int? genders;
  String? provinces;
  String? amphures;
  String? tambons;
  String? imageprofile;
  int? status;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        nameLastname: json["nameLastname"],
        genders: json["gender"],
        provinces: json["provinces"],
        amphures: json["amphures"],
        tambons: json["tambons"],
        imageprofile: json["Imageprofile"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "nameLastname": nameLastname,
        "gender": genders,
        "provinces": provinces,
        "amphures": amphures,
        "tambons": tambons,
        "Imageprofile": imageprofile,
        "status": status,
      };
}
