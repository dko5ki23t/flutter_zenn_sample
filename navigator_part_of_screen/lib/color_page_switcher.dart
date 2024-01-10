import 'package:flutter/material.dart';
import 'package:navigator_part_of_screen/color_detail_page.dart';
import 'package:navigator_part_of_screen/color_select_page.dart';

enum ColorPage {
  select,
  detail,
}

class ColorPageSwitcher extends StatefulWidget {
  const ColorPageSwitcher({super.key, required this.onSelect});

  final void Function(Color color) onSelect;

  @override
  State<ColorPageSwitcher> createState() => _ColorPageSwitcherState();
}

class _ColorPageSwitcherState extends State<ColorPageSwitcher> {
  ColorPage _currentPage = ColorPage.select;
  Color _color = Colors.blue;
  String _colorName = 'blue';

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (_currentPage) {
      case ColorPage.select:
        page = ColorSelectPage(
          onSelect: (color, colorName) => setState(() {
            _color = color;
            _colorName = colorName;
            _currentPage = ColorPage.detail;
          }),
        );
        break;
      case ColorPage.detail:
        page = ColorDetailPage(
          onSelect: () {
            widget.onSelect(_color);
            setState(() {
              _currentPage = ColorPage.select;
            });
          },
          color: _color,
          colorName: _colorName,
        );
        break;
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
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
      child: page,
    );
  }
}