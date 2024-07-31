import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_dimens.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/given/controller/given_controller.dart';
import 'package:flutter/material.dart';

class GivenPage extends StatefulWidget {
  const GivenPage({super.key});

  @override
  State<GivenPage> createState() => _GivenPageState();
}

class _GivenPageState extends State<GivenPage> {
  final _controller = GivenController();

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.given);
    return AppLayout(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_controller.buildHeader());
    widgetList.add(AppDimens.spaceHeigh24);
    widgetList.add(_controller.buildDropdownField(context, _controller.info.fieldList.first));
    widgetList.add(AppDimens.spaceHeigh16);
    widgetList.add(_controller.buildQuantitySelectorField(context));
    widgetList.add(AppDimens.spaceHeigh16);
    widgetList.add(_controller.buildSendButton(context));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
