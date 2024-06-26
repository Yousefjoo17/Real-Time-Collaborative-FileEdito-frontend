import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/services/UserFilePermissionService.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/core/utils/AssetsData.dart';
import 'package:fileeditor/features/FileManagment/widgets/FileEditingWidget.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FileView extends StatefulWidget {
  const FileView({super.key, required this.fileModel});

  final FileModel fileModel;
  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  bool isBold = false;
  bool isUnderlined = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBold = !isBold;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Image.asset(AssetsData.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isUnderlined = !isUnderlined;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Image.asset(AssetsData.underline),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      userfilesPermissions = await UserFilePermissionService()
                          .getAllPermissions(currUserModel.userID!);
                      await FileService().updateFileContent(
                          widget.fileModel.fileID!, newContent);
                      GoRouter.of(context).pop();
                      GoRouter.of(context).pop();
                      GoRouter.of(context).push(AppRouter.khomeView);
                    },
                    child: const Text("Back"),
                  )
                ],
              ),
            ),
            FileEditingWidget(
              isBold: isBold,
              isUnderlined: isUnderlined,
              fileModel: widget.fileModel,
            ),
          ],
        ),
      ),
    );
  }
}
