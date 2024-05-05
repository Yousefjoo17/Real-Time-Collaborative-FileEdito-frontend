import 'package:fileeditor/features/FileManagment/widgets/OtherOptionsbuttom.dart';
import 'package:fileeditor/features/FileManagment/widgets/ShareButton.dart';
import 'package:flutter/material.dart';

class FileActionsRow extends StatelessWidget {
  const FileActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "5/5/2024",
          style: TextStyle(fontSize: 18),
        ),
        ShareButton(),
        OtherOptionsButton(),
      ],
    );
  }
}
