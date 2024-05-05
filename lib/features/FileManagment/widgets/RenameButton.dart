import 'package:flutter/material.dart';

class RenameButton extends StatefulWidget {
  const RenameButton({Key? key}) : super(key: key);

  @override
  RenameButtonState createState() => RenameButtonState();
}

class RenameButtonState extends State<RenameButton> {
  bool isButtonVisible = true;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void toggleButtonVisibility() {
    setState(() {
      isButtonVisible = !isButtonVisible;
      if (!isButtonVisible) {
        textController.clear(); // Clear text when converting to button
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isButtonVisible
        ? ElevatedButton(
            onPressed: toggleButtonVisibility,
            child: const Row(
              children: [
                Icon(Icons.edit),
                Text('Rename'),
              ],
            ),
          )
        : Row(
            children: [
              SizedBox(
                width: 128,
                height: 32,
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'new name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Handle text changes
                  },
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.done,
                size: 32,
              ),
            ],
          );
  }
}
