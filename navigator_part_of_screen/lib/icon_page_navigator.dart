import 'package:flutter/material.dart';
import 'package:navigator_part_of_screen/icon_detail_page.dart';
import 'package:navigator_part_of_screen/icon_select_page.dart';

class IconPageNavigator extends StatelessWidget {
  const IconPageNavigator({super.key, required this.onSelect});

  final void Function(Icon icon) onSelect;

  void _pushDetailPage(BuildContext context, Icon icon, String iconName) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return IconDetailPage(
            icon: icon,
            iconName: iconName,
            onSelect: () {
              onSelect(icon);
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
            return IconSelectPage(
              onSelect: (icon, iconName) => _pushDetailPage(context, icon, iconName)
            );
          }
        );
      }),
    );
  }
}