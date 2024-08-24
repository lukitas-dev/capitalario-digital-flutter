import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/light/controller/light_controller.dart';
import 'package:flutter/material.dart';

class LightPage extends StatefulWidget {
  const LightPage({super.key});

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  final _controller = LightController();
  final _dimens = AppCore.infra.dimens;

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.home);
    return AppLayout(
      pageTitle: _controller.getTitle(),
      body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_dimens.spaceHeigh32);
    widgetList.addAll(_controller.buildButtonList());
    widgetList.add(_dimens.spaceHeigh32);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
