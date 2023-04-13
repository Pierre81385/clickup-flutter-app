import 'dart:convert';
import './user.dart';
import './invited_by.dart';
import './shared.dart';

Guest guestFromJson(String str) => Guest.fromJson(json.decode(str));

String guestToJson(Guest data) => json.encode(data.toJson());

class Guest {
  Guest({
    required this.guest,
  });

  GuestClass guest;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        guest: GuestClass.fromJson(json["guest"]),
      );

  Map<String, dynamic> toJson() => {
        "guest": guest.toJson(),
      };
}

class GuestClass {
  GuestClass({
    required this.user,
    required this.invitedBy,
    required this.canSeeTimeSpent,
    required this.canSeeTimeEstimated,
    required this.canEditTags,
    required this.canCreateViews,
    required this.shared,
  });

  User user;
  InvitedBy invitedBy;
  bool canSeeTimeSpent;
  bool canSeeTimeEstimated;
  bool canEditTags;
  bool canCreateViews;
  Shared shared;

  factory GuestClass.fromJson(Map<String, dynamic> json) => GuestClass(
        user: User.fromJson(json["user"]),
        invitedBy: InvitedBy.fromJson(json["invited_by"]),
        canSeeTimeSpent: json["can_see_time_spent"],
        canSeeTimeEstimated: json["can_see_time_estimated"],
        canEditTags: json["can_edit_tags"],
        canCreateViews: json["can_create_views"],
        shared: Shared.fromJson(json["shared"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "invited_by": invitedBy.toJson(),
        "can_see_time_spent": canSeeTimeSpent,
        "can_see_time_estimated": canSeeTimeEstimated,
        "can_edit_tags": canEditTags,
        "can_create_views": canCreateViews,
        "shared": shared.toJson(),
      };
}
