import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/features/FileManagment/widgets/OtherOptionsbuttom.dart';
import 'package:fileeditor/features/FileManagment/widgets/ShareButton.dart';
import 'package:flutter/material.dart';

class FileActionsRow extends StatelessWidget {
  const FileActionsRow({super.key, required this.fileModel});
  final FileModel fileModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "5/5/2024",
          style: TextStyle(fontSize: 18),
        ),
        const ShareButton(),
        OtherOptionsButton(fileModel: fileModel),
      ],
    );
  }
}
