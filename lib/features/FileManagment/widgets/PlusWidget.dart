import 'package:flutter/material.dart';

class PlusWdget extends StatelessWidget {
  const PlusWdget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        
      },
      icon: const Icon(
        Icons.add,
        size: 96,
        color: Colors.purple,
      ),
    );
  }
}
