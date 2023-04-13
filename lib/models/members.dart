import 'dart:convert';
import './user.dart';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  Member({
    required this.user,
  });

  User user;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}
