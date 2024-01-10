import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  const ColorDetailPage({
    super.key,
    required this.onSelect,
    required this.color,
    required this.colorName,
  });

  final void Function() onSelect;
  final Color color;
  final String colorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('色詳細'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(color: color,),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(colorName),
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