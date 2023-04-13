class CustomRole {
  CustomRole({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory CustomRole.fromJson(Map<String, dynamic> json) => CustomRole(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
