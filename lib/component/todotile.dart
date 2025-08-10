import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  const Todotile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(25.0),
        child: Row(
          children: [

            // checkbox
            // Checkbox(value: value, onChanged: onChanged)

            // text to show
            Text("Make video page "),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)
          ),
        
      ),
    );
  }
}
