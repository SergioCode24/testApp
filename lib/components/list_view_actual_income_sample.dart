import 'package:flutter/material.dart';

class ListViewActualIncomeSample extends StatelessWidget {
  final int itemCount;
  final String titleText;
  final int onPressedEdit;
  final int onPressedDelete;
  final String subtitleText;

  const ListViewActualIncomeSample(
      {super.key,
      required this.itemCount,
      required this.titleText,
      required this.onPressedEdit,
      required this.onPressedDelete,
      required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleText),
      subtitle: Text(subtitleText),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              onPressedEdit;
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onPressedDelete;
            },
          ),
        ],
      ),
    );
  }
}
