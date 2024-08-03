import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_dimensions.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  final _dimens = AppCore.infra.dimens;

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.home);
    return AppLayout(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_controller.buildHeader());
    widgetList.add(_dimens.spaceHeigh24);
    widgetList.add(_controller.buildTitle());
    widgetList.add(_dimens.spaceHeigh8);
    widgetList.add(_controller.buildSubtitle());
    widgetList.addAll(_controller.buildButtonList());

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
