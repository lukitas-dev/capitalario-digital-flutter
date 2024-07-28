import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopLayout;
  final Widget mobileLayout;
  
  const ResponsiveLayout({
    super.key,
    required this.desktopLayout,
    required this.mobileLayout,
  });
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return desktopLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
  
  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800;
  }
}
