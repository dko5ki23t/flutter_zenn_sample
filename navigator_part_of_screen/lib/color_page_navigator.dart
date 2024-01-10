import 'package:flutter/material.dart';
import 'package:navigator_part_of_screen/color_detail_page.dart';
import 'package:navigator_part_of_screen/color_select_page.dart';

class ColorPageNavigator extends StatelessWidget {
  const ColorPageNavigator({super.key, required this.onSelect});

  final void Function(Color color) onSelect;

  void _pushDetailPage(BuildContext context, Color color, String colorName) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return ColorDetailPage(
            color: color,
            colorName: colorName,
            onSelect: () {
              onSelect(color);
              Navigator.pop(context);
            }
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // 詳細ページを右から左にスライドイン
          const Offset begin = Offset(1.0, 0.0);
          const Offset end = Offset.zero;
          final Animatable<Offset> tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.easeInOut));
          final Animation<Offset> offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: ((settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ColorSelectPage(
              onSelect: (color, colorName) => _pushDetailPage(context, color, colorName)
            );
          }
        );
      }),
    );
  }
}