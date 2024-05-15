import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:flutter/material.dart';

class RenameButton extends StatefulWidget {
  const RenameButton({Key? key, required this.fileModel}) : super(key: key);
  final FileModel fileModel;
  @override
  RenameButtonState createState() => RenameButtonState();
}

class RenameButtonState extends State<RenameButton> {
  bool isButtonVisible = true;
  late TextEditingController textController;
  String newName = "";

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void toggleButtonVisibility() {
    setState(() {
      isButtonVisible = !isButtonVisible;
      if (!isButtonVisible) {
        textController.clear(); // Clear text when converting to button
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isButtonVisible
        ? ElevatedButton(
            onPressed: toggleButtonVisibility,
            child: const Row(
              children: [
                Icon(Icons.edit),
                Text('Rename'),
              ],
            ),
          )
        : Row(
            children: [
              SizedBox(
                width: 128,
                height: 32,
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'new name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    newName = value;
                  },
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  await FileService()
                      .renameFile(widget.fileModel.fileID!, newName);
                  widget.fileModel.fileName = newName;
                },
                icon: const Icon(Icons.done),
              )
            ],
          );
  }
}
