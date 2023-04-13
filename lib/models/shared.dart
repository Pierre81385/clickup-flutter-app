import 'dart:convert';

Shared sharedFromJson(String str) => Shared.fromJson(json.decode(str));

String sharedToJson(Shared data) => json.encode(data.toJson());

class Shared {
  Shared({
    required this.shared,
  });

  SharedClass shared;

  factory Shared.fromJson(Map<String, dynamic> json) => Shared(
        shared: SharedClass.fromJson(json["shared"]),
      );

  Map<String, dynamic> toJson() => {
        "shared": shared.toJson(),
      };
}

class SharedClass {
  SharedClass({
    required this.tasks,
    required this.lists,
    required this.folders,
  });

  List<dynamic> tasks;
  List<dynamic> lists;
  List<dynamic> folders;

  factory SharedClass.fromJson(Map<String, dynamic> json) => SharedClass(
        tasks: List<dynamic>.from(json["tasks"].map((x) => x)),
        lists: List<dynamic>.from(json["lists"].map((x) => x)),
        folders: List<dynamic>.from(json["folders"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "tasks": List<dynamic>.from(tasks.map((x) => x)),
        "lists": List<dynamic>.from(lists.map((x) => x)),
        "folders": List<dynamic>.from(folders.map((x) => x)),
      };
}
