import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/models/UpdatedFileModel.dart';
import 'package:fileeditor/core/services/UserFilePermissionService.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:fileeditor/core/services/updatedFileService.dart';
import 'package:fileeditor/features/FileManagment/UpadatedSatetCubit/updateedstates_cubit.dart';
import 'package:fileeditor/features/FileManagment/methods/FindDiff.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileEditingWidget extends StatefulWidget {
  const FileEditingWidget(
      {super.key,
      required this.isBold,
      required this.isUnderlined,
      required this.fileModel});
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
  FileService fileService = FileService();
  UpdatedFileModel updatedFileModel = UpdatedFileModel();
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
    return BlocConsumer<UpdateedstatesCubit, UpdateedstatesState>(
      listener: (context, state) {
        if (state is UpdatedFileState) {
          widget.fileModel.content = state.fileContent;
        }
      },
      builder: (context, state) {
        return TextField(
          controller: controller,
          readOnly: UserFilePermissionService()
              .isViewer(widget.fileModel.fileID!, currUserModel.userID!),
          style: TextStyle(
            color: Colors.black,
            fontWeight: widget.isBold ? FontWeight.bold : null,
            decoration: widget.isUnderlined ? TextDecoration.underline : null,
          ),
          onChanged: (value) async {
            currentText = value;
            newContent = value;
            widget.fileModel.content = value;
            if (currentText.length > lastText.length) {
              //I inserted letters
              String diff =
                  findDifference(shortText: lastText, longText: currentText);
              int pos = cursorPosition - diff.length;
              updatedFileModel.added = diff;
              updatedFileModel.pos = pos;
              await UpdatedFileService().doUpdate(updatedFileModel);

              print("00000000000000000000 ${updatedFileModel.added}");
              FileService().runUser(
                  widget.fileModel.fileID!, currUserModel.userID!, diff, pos);
              print("inserted $diff position $pos");
            } else {
              // I deleted letter
              String diff =
                  findDifference(shortText: currentText, longText: lastText);
              int pos = cursorPosition;
              await UpdatedFileService().doUpdate(updatedFileModel);
              print("deleted $diff position $pos");
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
      },
    );
  }
}
