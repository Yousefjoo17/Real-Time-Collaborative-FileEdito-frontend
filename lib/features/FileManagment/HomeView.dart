import 'package:fileeditor/core/widgets/Custom_Loading_indicator.dart';
import 'package:fileeditor/core/widgets/Custom_Error_widget.dart';
import 'package:fileeditor/features/FileManagment/cubit/files_management_cubit.dart';
import 'package:fileeditor/features/FileManagment/widgets/FileIcon.dart';
import 'package:fileeditor/features/FileManagment/widgets/PlusWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Browse your files or create new one",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Pacifico-Regular",
                ),
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
                      } else {
                        return FileIcon(
                          fileModel: state.files[index],
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
                  child: ErrorWidget(
                      CustomErrorWidget(errMessage: state.errMessage)),
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
