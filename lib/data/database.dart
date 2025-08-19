import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todoList = [];

  // reference our box
  final _mybox = Hive.box('mybox');

  // run this method when the app starts
  void createInitialData() {
    todoList = [
      ['tutorial Excercis', false],
      ['TodoaPP', false],
    ];
  }

  // load the data from database
  void loaddata() {
    todoList = _mybox.get("TODOLIST");
  }


  // update the database
  void updateDataBase() {
    _mybox.put("TODOLIST", todoList);
  }
}
