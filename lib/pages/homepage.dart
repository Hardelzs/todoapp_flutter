import 'package:flutter/material.dart';
import 'package:todoapp_flutter/component/todotile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),

      body: ListView(
        children: [
          Todotile(),
          Todotile(),
          Todotile(),
        ]
        
      ),
    );
  }
}
