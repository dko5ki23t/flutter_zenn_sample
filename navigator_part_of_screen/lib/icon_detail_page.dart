import 'package:flutter/material.dart';

class IconDetailPage extends StatelessWidget {
  const IconDetailPage({
    super.key,
    required this.onSelect,
    required this.icon,
    required this.iconName,
  });

  final void Function() onSelect;
  final Icon icon;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('アイコン詳細'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Icon(
                  icon.icon,
                  size: 100,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(iconName),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: TextButton(
                  onPressed: onSelect,
                  child: const Text('Set'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}