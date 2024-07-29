import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/infrastructure/app_settings.dart';
import 'package:app/core/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavBar extends StatefulWidget {
  final double opacity;
  final List<MenuItem> menuItens;
  const NavBar({
    Key? key,
    required this.opacity,
    required this.menuItens,
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
                        onTap: () => Modular.to.navigate(AppRoutes.home.path),
                        child: Text(
                          AppSettings.name,
                          style: TextStyle(
                              color: isHovering ? AppColors.accent : AppColors.black, fontSize: 20),
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
                  const Divider(
                    color: AppColors.white,
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
                fontSize: 20,
                color: item.isHovering ? item.onHoverColor : item.textColor,
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
                color: item.indicationColor,
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
