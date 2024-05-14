import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/features/FileManagment/widgets/FileActionsRow.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FileIcon extends StatelessWidget {
  const FileIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kfileView);
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
                  content,
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
