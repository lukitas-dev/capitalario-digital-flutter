import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/viewer/controller/viewer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ViewerPage extends StatefulWidget {
  const ViewerPage({super.key});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  final _controller = ViewerController();

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.viewer);
    return AppLayout(
      pageTitle: _controller.getTitle(),
      mobileBodyPadding: const EdgeInsets.all(24),
      body: Observer(
      builder: (_) {
        switch (_controller.getState()) {
          case AppState.loading:
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
    return _controller.buildBoxes();
  }
}
