import 'package:app/core/infrastructure/app_dimens.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/models/field_info.dart';
import 'package:app/core/models/quantity_field_info.dart';
import 'package:app/core/ui/dropdown_box.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/core/ui/quantity_selector.dart';
import 'package:app/given/models/given_info.dart';
import 'package:app/given/stores/given_store.dart';
import 'package:flutter/material.dart';

class GivenController {
  GivenStore store = GivenStore();
  late GivenInfo info;

  setup() {
    store.setup((givenInfo) {
      info = givenInfo;
    });
  }

  Widget buildHeader() {
    if (info.headerImagePath.isNotEmpty) {
      return Header(
          backgroundImage: AssetImage(info.headerImagePath),
          backgroundGradientColor: Colors.transparent);
    }
    return Container();
  }

  Widget buildDropdownField(BuildContext context, FieldInfo field) {
    if (field.label.isNotEmpty) {
      return Column(
        children: [
          Text(
            field.label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          AppDimens.spaceHeigh8,
          SizedBox(
              width: 260,
              child: DropdownBox(
                  hint: field.hint,
                  itemList: field.optionsList,
                  onSelect: store.setOffer)),
        ],
      );
    } else {
      return SizedBox(
          width: 260,
          child: DropdownBox(
              hint: field.hint,
              itemList: field.optionsList,
              onSelect: store.setOffer));
    }
  }

  Widget buildQuantitySelectorField(
      BuildContext context, QuantityFieldInfo info) {
    if (info.label.isNotEmpty) {
      return Column(
        children: [
          Text(
            info.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          AppDimens.spaceHeigh16,
          QuantitySelector(
              info: info,
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
          info: info,
          onTimerSelectorCallback: (value) {
            store.update(value);
          },
          onClearCallback: () {
            store.reset();
          },
          quantity: store.capitalQuantity);
    }
  }

  AppState getState() {
    return store.state;
  }
}
