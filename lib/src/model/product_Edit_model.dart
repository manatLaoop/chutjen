// To parse this JSON data, do
//
//     final productsmodel = productsmodelFromJson(jsonString);

import 'dart:convert';

List<Productsmodel> productsmodelFromJson(String str) =>
    List<Productsmodel>.from(
        json.decode(str).map((x) => Productsmodel.fromJson(x)));

String productsmodelToJson(List<Productsmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productsmodel {
  Productsmodel({
    this.id,
    this.addminid,
    this.pname,
    this.productid,
    this.pseparatetype,
    this.pseparate,
    this.priceDtail,
    this.pcolor,
  });

  String? id;
  String? addminid;
  String? pname;
  String? productid;
  String? pseparatetype;
  int? pseparate;
  List<PriceDtail>? priceDtail;
  String? pcolor;

  factory Productsmodel.fromJson(Map<String, dynamic> json) => Productsmodel(
        id: json["_id"],
        addminid: json["addminid"] == null ? null : json["addminid"],
        pname: json["Pname"],
        productid: json["productid"] == null ? null : json["productid"],
        pseparatetype: json["Pseparatetype"],
        pseparate: json["Pseparate"],
        priceDtail: json["priceDtail"] == null
            ? null
            : List<PriceDtail>.from(
                json["priceDtail"].map((x) => PriceDtail.fromJson(x))),
        pcolor: json["Pcolor"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "addminid": addminid == null ? null : addminid,
        "Pname": pname,
        "productid": productid == null ? null : productid,
        "Pseparatetype": pseparatetype,
        "Pseparate": pseparate,
        "priceDtail": priceDtail == null
            ? null
            : List<dynamic>.from(priceDtail!.map((x) => x.toJson())),
        "Pcolor": pcolor,
      };
}

class PriceDtail {
  PriceDtail({
    this.dtail,
    this.price,
  });
  String? dtail;
  String? price;

  factory PriceDtail.fromJson(Map<String, dynamic> json) => PriceDtail(
        price: json["Price"],
        dtail: json["Dtail"],
      );

  Map<String, dynamic> toJson() => {
        "Price": price,
        "Dtail": dtail,
      };
}
