import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_assets.dart';
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
  final _dimens = AppCore.infra.dimens;
  final _colors = AppCore.infra.colors;

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.given);
    return AppLayout(
      mobileBodyPadding: const EdgeInsets.all(0),
      body: Observer(
        builder: (_) {
          switch (_controller.getState()) {
            case AppState.success:
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
      ),
      footerBackgroundColor: _colors.fromHex("#D9D9D9"),
      footerTextColor: _colors.fromHex("#910909"),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_controller.buildHeader(context));
    widgetList.add(_dimens.spaceHeigh24);
    widgetList.addAll(_controller.buildDropdownFieldList(context));
    widgetList.add(_dimens.spaceHeigh16);
    widgetList.add(_controller.buildQuantitySelectorField(context));
    widgetList.add(_dimens.spaceHeigh16);
    widgetList.add(_controller.buildSendButton(context));
    widgetList.add(_dimens.spaceHeigh128);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
