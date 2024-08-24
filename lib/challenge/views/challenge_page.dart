import 'package:app/challenge/controller/challenge_controller.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _controller = ChallengeController();
  final _dimens = AppCore.infra.dimens;

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.challenges);
    return AppLayout(
        pageTitle: _controller.getTitle(),
        mobileBackgroundImage: _controller.getBackgroundImage().isNotEmpty
            ? _controller.getBackgroundImage()
            : null,
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_dimens.spaceHeigh128);
    widgetList.add(_dimens.spaceHeigh64);
    widgetList.addAll(_controller.buildButtonList(false));
    widgetList.add(_dimens.spaceHeigh128);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
