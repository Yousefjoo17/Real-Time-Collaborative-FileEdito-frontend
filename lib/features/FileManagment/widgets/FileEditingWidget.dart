import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/features/FileManagment/methods/FindDiff.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';

class FileEditingWidget extends StatefulWidget {
  const FileEditingWidget(
      {super.key, required this.isBold, required this.isUnderlined, required this.fileModel});
  final bool isBold;
  final bool isUnderlined;
  final FileModel fileModel;

  @override
  State<FileEditingWidget> createState() => _FileEditingWidgetState();
}

class _FileEditingWidgetState extends State<FileEditingWidget> {
  late TextEditingController controller;
  late int cursorPosition;
  String lastText = "";
  late String currentText;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.fileModel.content);
    controller.addListener(onTextChanged);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTextChanged() {
    cursorPosition = controller.selection.baseOffset;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontWeight: widget.isBold ? FontWeight.bold : null,
        decoration: widget.isUnderlined ? TextDecoration.underline : null,
      ),
      onChanged: (value) {
        currentText = value;
        content = value;
        if (currentText.length > lastText.length) {
          //I inserted letters
          String diff =
              findDifference(shortText: lastText, longText: currentText);
          print("inserted $diff position ${cursorPosition - diff.length}");
        } else {
          // I deleted letter
          String diff =
              findDifference(shortText: currentText, longText: lastText);
          print("deleted $diff position $cursorPosition");
        }
        lastText = value;
      },
      maxLines: 27,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
