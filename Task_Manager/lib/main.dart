import 'package:flutter/material.dart';

void main() {
  runApp(AppEntry());
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: TaskManager(),
    );
  }
}

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final List<String> taskList = [];
  final TextEditingController taskInputController = TextEditingController();

  void addTask() {
    if (taskInputController.text.isNotEmpty) {
      setState(() {
        taskList.add(taskInputController.text);
      });
      taskInputController.clear();
    }
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      taskList[index] = taskList[index].startsWith('✔️ ')
          ? taskList[index].substring(2)
          : '✔️ ${taskList[index]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/bg.jpg'), // Update with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: taskInputController,
                decoration: InputDecoration(
                  labelText: 'Enter a new task',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: addTask,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      taskList[index],
                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    onTap: () => toggleTaskCompletion(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
