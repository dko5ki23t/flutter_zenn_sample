import 'package:flutter/material.dart';
import 'package:navigator_part_of_screen/icon_detail_page.dart';
import 'package:navigator_part_of_screen/icon_select_page.dart';

enum IconPage {
  select,
  detail,
}

class IconPageSwitcher extends StatefulWidget {
  const IconPageSwitcher({super.key, required this.onSelect});

  final void Function(Icon icon) onSelect;

  @override
  State<IconPageSwitcher> createState() => _IconPageSwitcherState();
}

class _IconPageSwitcherState extends State<IconPageSwitcher> {
  IconPage _currentPage = IconPage.select;
  Icon _icon = const Icon(Icons.add);
  String _iconName = 'add';

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (_currentPage) {
      case IconPage.select:
        page = IconSelectPage(
          onSelect: (icon, iconName) => setState(() {
            _icon = icon;
            _iconName = iconName;
            _currentPage = IconPage.detail;
          }),
        );
        break;
      case IconPage.detail:
        page = IconDetailPage(
          onSelect: () {
            widget.onSelect(_icon);
            setState(() {
              _currentPage = IconPage.select;
            });
          },
          icon: _icon,
          iconName: _iconName,
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