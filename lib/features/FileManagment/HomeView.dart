import 'package:fileeditor/features/FileManagment/widgets/FileIcon.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const FileIcon();
              },
              childCount: 23,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.65,
              crossAxisSpacing: 8,
              mainAxisSpacing: 20,
            ),
          ),
        ],
      ),
    );
  }
}
