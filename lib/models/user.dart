import 'dart:convert';
import 'package:clickupflutterapp/models/customrole.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
  });

  UserClass user;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class UserClass {
  UserClass({
    required this.id,
    required this.username,
    required this.email,
    this.color,
    this.profilePicture,
    required this.initials,
    required this.role,
    required this.customRole,
    this.lastActive,
    this.dateJoined,
    required this.dateInvited,
  });

  int id;
  String username;
  String email;
  dynamic color;
  dynamic profilePicture;
  String initials;
  int role;
  CustomRole customRole;
  dynamic lastActive;
  dynamic dateJoined;
  String dateInvited;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        color: json["color"],
        profilePicture: json["profilePicture"],
        initials: json["initials"],
        role: json["role"],
        customRole: CustomRole.fromJson(json["custom_role"]),
        lastActive: json["last_active"],
        dateJoined: json["date_joined"],
        dateInvited: json["date_invited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "color": color,
        "profilePicture": profilePicture,
        "initials": initials,
        "role": role,
        "custom_role": customRole.toJson(),
        "last_active": lastActive,
        "date_joined": dateJoined,
        "date_invited": dateInvited,
      };
}
