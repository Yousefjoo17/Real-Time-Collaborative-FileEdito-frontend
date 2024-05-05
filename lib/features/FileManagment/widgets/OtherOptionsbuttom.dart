import 'package:flutter/material.dart';

class OtherOptionsButton extends StatelessWidget {
  const OtherOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
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
              child: ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    Spacer(),
                    Text("Rename"),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              child: ElevatedButton(
                onPressed: () {},
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
      },
    );
  }
}
