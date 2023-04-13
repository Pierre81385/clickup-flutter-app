import 'dart:convert';

InvitedBy invitedByFromJson(String str) => InvitedBy.fromJson(json.decode(str));

String invitedByToJson(InvitedBy data) => json.encode(data.toJson());

class InvitedBy {
  InvitedBy({
    required this.invitedBy,
  });

  InvitedByClass invitedBy;

  factory InvitedBy.fromJson(Map<String, dynamic> json) => InvitedBy(
        invitedBy: InvitedByClass.fromJson(json["invited_by"]),
      );

  Map<String, dynamic> toJson() => {
        "invited_by": invitedBy.toJson(),
      };
}

class InvitedByClass {
  InvitedByClass({
    required this.id,
    required this.username,
    required this.color,
    required this.email,
    required this.initials,
    this.profilePicture,
  });

  int id;
  String username;
  String color;
  String email;
  String initials;
  dynamic profilePicture;

  factory InvitedByClass.fromJson(Map<String, dynamic> json) => InvitedByClass(
        id: json["id"],
        username: json["username"],
        color: json["color"],
        email: json["email"],
        initials: json["initials"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "color": color,
        "email": email,
        "initials": initials,
        "profilePicture": profilePicture,
      };
}
