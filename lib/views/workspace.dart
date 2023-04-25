import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/members.dart';
import '../models/teams.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamPage extends StatefulWidget {
  final String apiKey;

  const TeamPage({required this.apiKey});

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  late String _myKey;

  final queryParameters = {
    'archived': 'false',
    'page': '0',
    'order_by': 'string',
    'reverse': 'true',
    'subtasks': 'true',
    'statuses': 'string',
    'include_closed': 'true',
    'assignees': 'string',
    'tags': 'string',
    'due_date_gt': '0',
    'due_date_lt': '0',
    'date_created_gt': '0',
    'date_created_lt': '0',
    'date_updated_gt': '0',
    'date_updated_lt': '0',
    'date_done_gt': '0',
    'date_done_lt': '0',
    'custom_fields': 'string'
  };

  final listId = '900900544557';

  @override
  void initState() {
    super.initState();
    _myKey = widget.apiKey;
    _getTasks();
  }

  void _getTasks() async {
    final response = await http.get(
      Uri.parse('https://api.clickup.com/api/v2/list/' +
          listId +
          '/task?' +
          queryParameters.toString()),
      headers: {
        //HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: _myKey,
      },
    );
    if (response.statusCode == 200) {
      var object = jsonDecode(response.body);
      print(response.body);
    } else {
      throw Exception('Failed to load teams');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Teams'),
        ),
        body: const Text('teams'));
  }
}

class TeamWidget extends StatelessWidget {
  final Team team;

  const TeamWidget({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(team.avatar),
      ),
      title: Text(
        team.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(team.color),
      onTap: () {
        // Navigate to team details page
      },
    );
  }
}

class MemberWidget extends StatelessWidget {
  final Member member;

  const MemberWidget({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(member.user.user.profilePicture),
      ),
      title: Text(
        member.user.user.username,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(member.user.user.email),
      onTap: () {
        // Navigate to member details page
      },
    );
  }
}
