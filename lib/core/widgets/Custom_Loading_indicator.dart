import 'package:flutter/material.dart';

class CustomloadingIndicatorWidget extends StatelessWidget {
  const CustomloadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}