import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/layout/desktop_layout.dart';
import 'package:app/core/layout/mobile_layout.dart';
import 'package:app/core/layout/responsive_layout.dart';
import 'package:app/core/ui/footer.dart';
import 'package:app/core/ui/navbar.dart';
import 'package:app/core/ui/sidemenu.dart';
import 'package:app/core/ui/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  final _settings = AppCore.getSettings();

  @override
  Widget build(BuildContext context) {
    final colors = AppCore.infra.colors;
    final screenSize = MediaQuery.of(context).size;
    final menuItens = AppCore.infra.menu.load(_settings.menuItemList);
    final navbarInfo = _settings.navbarInfo;

    return ResponsiveLayout(
        desktopLayout: DesktopLayout(
          backgroundColor: colors.fromHex(_settings.backgroundColor),
          navbar: NavBar(
            title: _settings.name,
            onTitleClick: () => Modular.to.navigate(AppRoutes.home.path),
            opacity: 0,
            menuItens: menuItens,
            titleTextSize: navbarInfo.titleTextSize,
            titleColor: colors.fromHex(navbarInfo.titleTextColor),
            titleOnHoverColor: colors.fromHex(navbarInfo.titleOnHoverColor),
            dividerColor: colors.fromHex(navbarInfo.dividerColor),
            textSize: navbarInfo.textSize,
            textColor: colors.fromHex(navbarInfo.textColor),
            onHoverColor: colors.fromHex(navbarInfo.onHoverColor),
            indicationColor: colors.fromHex(navbarInfo.indicationColor),
          ),
          header: header ?? Container(),
          body: body,
          footer: const Footer(
            isMobile: false,
          ),
        ),
        mobileLayout: MobileLayout(
          backgroundColor: colors.fromHex(_settings.backgroundColor),
          appBar: Toolbar(
            hasBack: hasBack,
            onBackCallback: onBackCallback,
            title:
                pageTitle != null ? pageTitle!.toUpperCase() : _settings.name,
            titleStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colors.fromHex(_settings.toolbarTextColor)),
            onBackColor: colors.fromHex(_settings.toolbarTextColor),
            backgroundColor: colors.fromHex(_settings.toolbarBackgroundColor),
          ),
          drawer: _settings.isSideMenuEnabled ? SideMenu(
            header: _settings.sideMenuInfo.showLogo ? SizedBox(
                width: screenSize.width,
                height: 150,
                child: Center(
                  child: Image.asset(
                    AppAssets.logo.path,
                    width: 180,
                  ),
                )) : Container(),
            menuItens: menuItens,
            backgroundColor: colors.fromHex(_settings.sideMenuInfo.backgroundColor),
            homeTitle: _settings.sideMenuInfo.homeTitle,
          ) : Container(),
          header: header ?? Container(),
          body: body,
          bodyPadding: mobileBodyPadding,
          footer: const Footer(
            isMobile: true,
          ),
        ));
  }
}
