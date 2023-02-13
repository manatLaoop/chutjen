// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

List<Token> tokenFromJson(String str) =>
    List<Token>.from(json.decode(str).map((x) => Token.fromJson(x)));

String tokenToJson(List<Token> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Token {
  Token({
    required this.token,
  });

  String? token;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "Token": token,
      };
}
