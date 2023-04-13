import 'dart:convert';
import './members.dart';

Teams teamsFromJson(String str) => Teams.fromJson(json.decode(str));

String teamsToJson(Teams data) => json.encode(data.toJson());

class Teams {
  Teams({
    required this.teams,
  });

  List<Team> teams;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.color,
    required this.avatar,
    required this.members,
  });

  String id;
  String name;
  String color;
  String avatar;
  List<Member> members;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        avatar: json["avatar"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "avatar": avatar,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}
