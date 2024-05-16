import 'package:fileeditor/core/services/UserFilePermissionService.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/core/widgets/Custom_Loading_indicator.dart';
import 'package:fileeditor/core/widgets/Custom_Error_widget.dart';
import 'package:fileeditor/features/FileManagment/cubit/files_management_cubit.dart';
import 'package:fileeditor/features/FileManagment/widgets/FileIcon.dart';
import 'package:fileeditor/features/FileManagment/widgets/PlusWidget.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserFilePermissionService userFilePermissionService =
        UserFilePermissionService();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Browse your files or create new one",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Pacifico-Regular",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                      GoRouter.of(context).push(AppRouter.ksigninView);
                    },
                    child: Container(
                      color: Colors.blueAccent,
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          BlocBuilder<FilesManagementCubit, FilesManagementState>(
            builder: (context, state) {
              if (state is FilesManagementSuccess) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == state.files.length) {
                        return const PlusWidget();
                      } else if (userFilePermissionService.isOwner(
                              state.files[index].fileID!,
                              currUserModel.userID!) ||
                          userFilePermissionService.isEditor(
                              state.files[index].fileID!,
                              currUserModel.userID!) ||
                          userFilePermissionService.isViewer(
                              state.files[index].fileID!,
                              currUserModel.userID!)) {
                        return FileIcon(
                          fileModel: state.files[index],
                        );
                      } else {
                        return const Icon(
                          Icons.no_accounts,
                          size: 66,
                        );
                      }
                    },
                    childCount: state.files.length + 1,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 20,
                  ),
                );
              } else if (state is FilesManagementFailure) {
                return SliverToBoxAdapter(
                  child: ErrorWidget(Center(
                      child: CustomErrorWidget(errMessage: state.errMessage))),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: CustomloadingIndicatorWidget(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
