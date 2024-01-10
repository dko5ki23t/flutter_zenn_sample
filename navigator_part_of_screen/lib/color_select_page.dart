import 'package:flutter/material.dart';

class ColorSelectPage extends StatelessWidget {
  const ColorSelectPage({super.key, required this.onSelect});

  final void Function(Color color, String colorName) onSelect;

  static const _selectableColors = {
    "red": Colors.red,
    "orange": Colors.orange,
    "yellow": Colors.yellow,
    "lightGreen": Colors.lightGreen,
    "green": Colors.green,
    "blue": Colors.blue,
    "purple": Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('色選択'),
      ),
      body: Center(
        child: ListView(
          children: [
            for (final color in _selectableColors.entries)
            ListTile(
              title: Text(color.key),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => onSelect(color.value, color.key),
            )
          ],
        ),
      ),
    );
  }
}