import 'package:app/core/models/widget_options.dart';
import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  final VoidCallback onTap;
  final WidgetOptions options;
  final String text;

  const ButtonBox(
      {required this.onTap, required this.options, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: options.width,
      height: options.height,
      child: InkWell(
        onTap: onTap,
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: options.margin,
      elevation: 4,
      shape: RoundedRectangleBorder(
        side:
            BorderSide(color: options.borderColor, width: options.borderWidth),
        borderRadius: BorderRadius.circular(options.borderRadius),
      ),
      child: _buildCardBody(),
    );
  }

  Widget _buildCardBody() {
    return Container(
      padding: options.padding,
      alignment: Alignment.center,
      color: options.backgroundColor,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: options.textFontSize,
              color: options.textColor)),
    );
  }
}
