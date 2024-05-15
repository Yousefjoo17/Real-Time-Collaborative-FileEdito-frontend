import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/features/FileManagment/widgets/FileActionsRow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FileIcon extends StatelessWidget {
  const FileIcon({super.key, required this.fileModel});
  final FileModel fileModel;

  get fileService => null;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FileService().openFile(fileModel.fileID!);
        GoRouter.of(context).push(AppRouter.kfileView, extra: fileModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 0,
                  offset: const Offset(5, 0),
                )
              ],
            ),
            child: const Card(
              color: Color.fromARGB(255, 183, 159, 185),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FileActionsRow(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            left: 10,
            child: SizedBox(
              width: 60,
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Text(
                  fileModel.content ?? "",
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
