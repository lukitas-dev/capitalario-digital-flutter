import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core/models/menu_item.dart';

class NavBar extends StatefulWidget {
  final String title;
  final VoidCallback onTitleClick;
  final List<MenuItem> menuItens;
  final double opacity;
  final double? titleTextSize;
  final Color? titleColor;
  final Color? titleOnHoverColor;
  final Color? dividerColor;
  final double? textSize;
  final Color? textColor;
  final Color? onHoverColor;
  final Color? indicationColor;

  const NavBar({
    Key? key,
    required this.title,
    required this.onTitleClick,
    required this.menuItens,
    required this.opacity,
    this.titleTextSize,
    this.titleColor,
    this.titleOnHoverColor,
    this.dividerColor,
    this.textSize,
    this.textColor,
    this.onHoverColor,
    this.indicationColor,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBar> {
  late Size screenSize;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return PreferredSize(
        preferredSize: Size(screenSize.width, 120),
        child: Container(
            color: BottomAppBarTheme.of(context)
                .color
                ?.withOpacity(widget.opacity),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(
                      width: 250,
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            value ? isHovering = true : isHovering = false;
                          });
                        },
                        onTap: widget.onTitleClick,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              color: isHovering
                                  ? widget.titleOnHoverColor ?? Colors.amber
                                  : widget.titleColor ?? Colors.black,
                              fontSize: widget.titleTextSize),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _getItens())),
                    const SizedBox(
                      width: 200,
                    )
                  ]),
                  Divider(
                    color: widget.dividerColor ?? Colors.white,
                    thickness: 2,
                  )
                ]))));
  }

  List<Widget> _getItens() {
    var x = 1;
    List<Widget> list = [];
    for (var item in widget.menuItens) {
      list.add(InkWell(
        onHover: (value) {
          setState(() {
            value ? item.isHovering = true : item.isHovering = false;
          });
        },
        onTap: () => Modular.to.navigate(item.routePath),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: TextStyle(
                fontSize: widget.textSize,
                color: item.isHovering
                    ? widget.onHoverColor ?? Colors.amber
                    : widget.textColor ?? Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: item.isHovering,
              child: Container(
                height: 2,
                width: 20,
                color: widget.indicationColor ?? Colors.amber,
              ),
            )
          ],
        ),
      ));
      if (x < widget.menuItens.length) {
        list.add(SizedBox(width: screenSize.width / 50));
      }
      x++;
    }
    return list;
  }
}
