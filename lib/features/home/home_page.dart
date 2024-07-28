import 'package:app/core/layout/app_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return const Center(
      child: Text("Screen is under construction XD"),
    );
  }
}
