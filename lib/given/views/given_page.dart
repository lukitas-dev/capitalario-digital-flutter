import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_dimens.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/given/controller/given_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    return AppLayout(body: Observer(
      builder: (_) {
        switch (_controller.getState()) {
          case AppState.loading:
            if (_controller.showAlert()) {
              _controller.showSendAlert(context);
            }
            return Center(
              child: Image.asset(
                AppAssets.loading.path,
                width: 150,
              ),
            );
          case AppState.ready:
            return _buildBody(context);
          case AppState.failure:
          default:
            return const Center(
              child: Text("Houve um problema no carregamento da página"),
            );
        }
      },
    ));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_controller.buildHeader());
    widgetList.add(AppDimens.spaceHeigh24);
    widgetList.add(_controller.buildDropdownField(
        context, _controller.info.fieldList.first));
    widgetList.add(AppDimens.spaceHeigh16);
    widgetList.add(_controller.buildQuantitySelectorField(context));
    widgetList.add(AppDimens.spaceHeigh16);
    widgetList.add(_controller.buildSendButton(context));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
