import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_menu.dart';
import 'package:app/core/infrastructure/app_settings.dart';
import 'package:app/core/layout/desktop_layout.dart';
import 'package:app/core/layout/mobile_layout.dart';
import 'package:app/core/layout/responsive_layout.dart';
import 'package:app/core/ui/footer.dart';
import 'package:app/core/ui/navbar.dart';
import 'package:app/core/ui/sidemenu.dart';
import 'package:app/core/ui/toolbar.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final String? pageTitle;
  final bool hasBack;
  final VoidCallback? onBackCallback;
  final Widget? header;
  final Widget body;
  final EdgeInsets mobileBodyPadding;
  AppLayout({
    Key? key,
    this.pageTitle,
    this.hasBack = false,
    this.onBackCallback,
    this.header,
    required this.body,
    this.mobileBodyPadding = const EdgeInsets.only(left: 26, right: 26),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var menuItens = AppMenu.list();
    return ResponsiveLayout(
        desktopLayout: DesktopLayout(
          backgroundColor: AppColors.background,
          navbar: NavBar(opacity: 0, menuItens: menuItens),
          header: header ?? Container(),
          body: body,
          footer: const Footer(
            isMobile: false,
          ),
        ),
        mobileLayout: MobileLayout(
          backgroundColor: AppColors.background,
          appBar: Toolbar(
            hasBack: hasBack,
            onBackCallback: onBackCallback,
            title:
                pageTitle != null ? pageTitle!.toUpperCase() : AppSettings.name,
            titleStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.browLight),
            onBackColor: AppColors.browLight,
            backgroundColor: AppColors.grey,
          ),
          drawer: SideMenu(
            header: SizedBox(
                width: screenSize.width,
                height: 150,
                child: Center(
                  child: Image.asset(
                    AppAssets.logo.path,
                    width: 180,
                  ),
                )),
            menuItens: menuItens,
          ),
          header: header ?? Container(),
          body: body,
          bodyPadding: mobileBodyPadding,
          footer: const Footer(
            isMobile: true,
          ),
        ));
  }
}
