import 'package:flutter/material.dart';

class IconSelectPage extends StatelessWidget {
  const IconSelectPage({super.key, required this.onSelect});

  final void Function(Icon icon, String iconName) onSelect;

  static const _selectableIcons = {
    "add": Icon(Icons.add),
    "edit": Icon(Icons.edit),
    "settings": Icon(Icons.settings),
    "zoom_in": Icon(Icons.zoom_in),
    "zoom_out": Icon(Icons.zoom_out),
    "soccer": Icon(Icons.sports_soccer),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('アイコン選択'),
      ),
      body: Center(
        child: ListView(
          children: [
            for (final icon in _selectableIcons.entries)
            ListTile(
              title: Text(icon.key),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => onSelect(icon.value, icon.key),
            )
          ],
        ),
      ),
    );
  }
}