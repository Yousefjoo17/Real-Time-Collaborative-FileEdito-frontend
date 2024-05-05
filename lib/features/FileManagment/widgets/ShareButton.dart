import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    height: 30,
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: "name",
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Owner"),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Editor"),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Viewer"),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
      },
      icon: const Icon(
        Icons.mobile_screen_share_sharp,
        size: 32,
      ),
    );
  }
}
