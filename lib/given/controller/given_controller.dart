import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/layout/responsive_layout.dart';
import 'package:app/core/models/field_info.dart';
import 'package:app/core/models/widget_options.dart';
import 'package:app/core/ui/alerts.dart';
import 'package:app/core/ui/button_box.dart';
import 'package:app/core/ui/dropdown_box.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/core/ui/quantity_selector.dart';
import 'package:app/given/models/given_info.dart';
import 'package:app/given/stores/given_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GivenController {
  final _colors = AppCore.infra.colors;
  final _dimens = AppCore.infra.dimens;
  GivenStore store = GivenStore();
  late GivenInfo info;

  setup() {
    store.setup((givenInfo) {
      info = givenInfo;
    });
  }

  Widget buildHeader(BuildContext context) {
    if (info.headerImagePath.isNotEmpty &&
        ResponsiveLayout.isMobileScreen(context)) {
      return Header(
          height: 200.0,
          backgroundImage: AssetImage(info.headerImagePath),
          backgroundGradientColor: Colors.transparent);
    }
    return Container();
  }

  Widget buildDropdownField(BuildContext context, FieldInfo field) {
    var styleInfo = info.fieldStyleInfo;
    final screenSize = MediaQuery.of(context).size;
    if (field.label.isNotEmpty) {
      return Column(
        children: [
          Text(
            field.label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _dimens.spaceHeigh8,
          SizedBox(
              width: screenSize.width * 0.8,
              child: DropdownBox(
                  hint: field.hint,
                  itemList: field.optionsList,
                  onSelect: store.setOffer)),
        ],
      );
    } else {
      return SizedBox(
          width: screenSize.width * 0.8,
          child: DropdownBox(
              arrowColor: _colors.fromHex(styleInfo.arrowColor),
              backgroundColor: _colors.fromHex(styleInfo.backgroundColor),
              selectionListBackgroundColor:
                  _colors.fromHex(styleInfo.selectionBackgroundColor),
              hint: field.hint,
              hintTextStyle: TextStyle(
                  color: _colors.fromHex(styleInfo.textColor),
                  fontSize: styleInfo.textSize,
                  fontWeight: FontWeight.bold),
              itemList: field.optionsList,
              onSelect: store.setOffer,
              selectedTextStyle: TextStyle(
                  color: _colors.fromHex(styleInfo.textColor),
                  fontSize: styleInfo.textSize,
                  fontWeight: FontWeight.bold),
              itemTextStyle: TextStyle(
                  color: _colors.fromHex(styleInfo.selectionTextColor),
                  fontSize: styleInfo.selectionTextSize,
                  fontWeight: FontWeight.bold)));
    }
  }

  List<Widget> buildDropdownFieldList(BuildContext context) {
    if (info.fieldList.isNotEmpty) {
      List<Widget> widgetList = [];
      for (final fieldInfo in info.fieldList) {
        widgetList.add(buildDropdownField(context, fieldInfo));
        widgetList.add(AppCore.infra.dimens.spaceHeigh24);
      }
      return widgetList;
    }
    return [Container()];
  }

  Widget buildQuantitySelectorField(BuildContext context) {
    var quantityInfo = info.quantityField;
    if (quantityInfo.label.isNotEmpty) {
      return Column(
        children: [
          Text(
            quantityInfo.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _dimens.spaceHeigh16,
          QuantitySelector(
              backgroundColor: _colors.fromHex(quantityInfo.backgroundColor),
              info: quantityInfo,
              onTimerSelectorCallback: (value) {
                store.update(value);
              },
              onClearCallback: () {
                store.reset();
              },
              quantity: store.capitalQuantity)
        ],
      );
    } else {
      return QuantitySelector(
          backgroundColor: _colors.fromHex(quantityInfo.backgroundColor),
          inputBackgroundColor:
              _colors.fromHex(quantityInfo.inputBackgroundColor),
          info: quantityInfo,
          onTimerSelectorCallback: (value) {
            store.update(value);
          },
          onClearCallback: () {
            store.reset();
          },
          quantity: store.capitalQuantity);
    }
  }

  Widget buildSendButton(BuildContext context) {
    if (store.enableSendButton) {
      var styleInfo = info.sendButtonStyle;
      return ButtonBox(
        onTap: () async {
          await store.sendCapital();
        },
        options: WidgetOptions(
            borderColor: _colors.fromHex(styleInfo.borderColor),
            backgroundColor: _colors.fromHex(styleInfo.backgroundColor),
            textColor: _colors.fromHex(styleInfo.textColor),
            width: 240,
            height: styleInfo.height,
            borderRadius: styleInfo.borderRadius,
            textFontSize: styleInfo.textFontSize),
        text: info.sendTitleButton,
      );
    } else {
      return Container();
    }
  }

  showSendAlert(BuildContext context) async {
    store.showAlert = false;
    await Future.delayed(const Duration(seconds: 3));
    var image = Image.asset(AppAssets.giveSuccess.path, height: 200);
    var alert = info.sendAlert;
    if (context.mounted) {
      AppAlerts.showSendCapitalAlert(context, alert.title, alert.description,
          alert.button, () => Modular.to.navigate(AppRoutes.home.path), image);
    }
  }

  AppState getState() {
    return store.state;
  }

  bool showAlert() {
    return store.showAlert;
  }
}
