import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlusWidget extends StatefulWidget {
  const PlusWidget({super.key});

  @override
  State<PlusWidget> createState() => _PlusWidgetState();
}

class _PlusWidgetState extends State<PlusWidget> {
  bool isButtonVisible = true;
  late TextEditingController textController;
  String name = "";

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
        ? IconButton(
            onPressed: toggleButtonVisibility,
            icon: const Icon(
              Icons.plus_one,
              size: 96,
              color: Colors.purple,
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    name = value;
                  },
                ),
              ),
              const SizedBox(height: 30),
              IconButton(
                onPressed: () async {
                  int id = await FileService().generateFileID();
                  FileModel fileModel =
                      FileModel(fileID: id, fileName: name, content: "");
                  FileService().createFile(fileModel);
                  GoRouter.of(context)
                      .push(AppRouter.kfileView, extra: fileModel);
                },
                icon: const Icon(
                  Icons.done,
                  size: 32,
                ),
              )
            ],
          );
  }
}
