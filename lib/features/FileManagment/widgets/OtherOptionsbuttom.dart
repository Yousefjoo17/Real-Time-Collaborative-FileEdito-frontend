import 'package:fileeditor/core/helpers/CustomShowSnackBar.dart';
import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/services/UserFilePermissionService.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/features/FileManagment/widgets/RenameButton.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtherOptionsButton extends StatelessWidget {
  const OtherOptionsButton({super.key, required this.fileModel});
  final FileModel fileModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        if (UserFilePermissionService()
            .isOwner(fileModel.fileID!, currUserModel.userID!)) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final Offset position = renderBox.localToGlobal(Offset.zero);
          final Size size = renderBox.size;
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(
              position.dx,
              position.dy + size.height, // Place menu below the button
              position.dx + size.width,
              position.dy + size.height + 100, // Adjust as needed
            ),
            items: [
              PopupMenuItem(
                child: RenameButton(fileModel: fileModel),
              ),
              PopupMenuItem(
                child: ElevatedButton(
                  onPressed: () async {
                    await FileService().deleteFile(fileModel.fileID!);
                    GoRouter.of(context).pop();
                    GoRouter.of(context).push(AppRouter.khomeView);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.remove_done_outlined),
                      Spacer(),
                      Text("Remove"),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          showmySnackBar(context, "You are not an owner");
        }
      },
    );
  }
}
