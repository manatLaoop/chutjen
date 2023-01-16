// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

List<Address> addressFromJson(String str) =>
    List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  Address({
    this.id,
    this.nameTh,
  });

  int? id;
  String? nameTh;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        nameTh: json["name_th"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_th": nameTh,
      };
}
