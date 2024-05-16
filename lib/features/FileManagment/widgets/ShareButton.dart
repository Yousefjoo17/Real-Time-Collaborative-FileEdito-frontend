import 'package:fileeditor/core/helpers/CustomShowSnackBar.dart';
import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/models/UserFilePermission.dart';
import 'package:fileeditor/core/models/UserModel.dart';
import 'package:fileeditor/core/services/UserFilePermissionService.dart';
import 'package:fileeditor/core/services/userService.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({
    super.key,
    required this.fileModel,
  });
  final FileModel fileModel;

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  String userName = "";
  int permission = 0;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (UserFilePermissionService()
            .isOwner(widget.fileModel.fileID!, currUserModel.userID!)) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 30,
                      child: TextField(
                        onChanged: (value) {
                          userName = value;
                        },
                        decoration: const InputDecoration(
                          hintText: "name",
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            permission = 0;
                          },
                          child: const Text("Owner"),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            permission = 1;
                          },
                          child: const Text("Editor"),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            permission = 2;
                          },
                          child: const Text("Viewer"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        UserModel userModel = UserModel(username: userName);

                        List<UserModel> users =
                            await UserService().getAllUsers();

                        bool nameISfound =
                            UserService().isUsernameExists(users, userModel);

                        int? userid =
                            UserService().getUserIDbyName(users, userName);

                        UserFilePermission userFilePermission =
                            UserFilePermission(
                          fileId: widget.fileModel.fileID,
                          userId: userid,
                          permisson: permission,
                        );

                        if (nameISfound) {
                          await UserFilePermissionService()
                              .createUserFilePermission(userFilePermission);
                          showmySnackBar(
                              context, "permission was given successfully");
                        } else {
                          showmySnackBar(context, "User is not found");
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.purple)),
                      child: const Text("Save "),
                    )
                  ],
                ),
              ),
            ],
          );
        } else {
          showmySnackBar(context, "You are not an owner");
        }
      },
      icon: const Icon(
        Icons.mobile_screen_share_sharp,
        size: 32,
      ),
    );
  }
}
