import 'package:flutter/material.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search members...', icon: Icon(Icons.search)),
                ),
              ),
              const SizedBox(
                  width:
                      8.0), // Adding some space between the search field and button
              IconButton(onPressed: () {}, icon: const Icon(Icons.group_add))
            ],
          ),
        ),
      ],
    );
  }
}
