import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_dimens.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/pray/controller/pray_controller.dart';
import 'package:flutter/material.dart';

class PrayPage extends StatefulWidget {
  const PrayPage({super.key});

  @override
  State<PrayPage> createState() => _PrayPageState();
}

class _PrayPageState extends State<PrayPage> {
  final _controller = PrayController();

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.pray);
    return AppLayout(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_controller.buildHeader());
    widgetList.add(AppDimens.spaceHeigh24);
    widgetList.add(_controller.buildTitle());
    widgetList.add(AppDimens.spaceHeigh8);
    widgetList.add(_controller.buildText());

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
