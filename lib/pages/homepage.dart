import 'package:flutter/material.dart';
import 'package:todoapp_flutter/component/dialogbox.dart';
import 'package:todoapp_flutter/component/todotile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_flutter/data/database.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // reference
  final _mybox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    // the first time ever opening the app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  void checkBoxChnaged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChnaged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
