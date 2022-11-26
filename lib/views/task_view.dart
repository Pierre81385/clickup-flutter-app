import 'package:flutter/material.dart';
import '../routes/task_routes.dart';
import '../models/task_model.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late Future<Task> futureTask;

  @override
  void initState() {
    super.initState();
    futureTask = getTask('3vxmaw7');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Task>(
            future: futureTask,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.dateCreated);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
