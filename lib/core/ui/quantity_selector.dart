import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_dimens.dart';
import 'package:app/core/models/quantity_field_info.dart';
import 'package:flutter/material.dart';

typedef QuantitySelectorCallback = void Function(int number);

class QuantitySelector extends StatelessWidget {
  final QuantityFieldInfo info;
  final QuantitySelectorCallback onTimerSelectorCallback;
  final VoidCallback onClearCallback;
  final TextEditingController quantity;
  const QuantitySelector({
    Key? key,
    required this.info,
    required this.onTimerSelectorCallback,
    required this.onClearCallback,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTextField(context),
        AppDimens.spaceHeigh16,
        _buildOptions(context),
        AppDimens.spaceHeigh16,
      ],
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: "addBtn",
          onPressed: () => onTimerSelectorCallback(1),
          elevation: 4,
          backgroundColor: AppColors.grey,
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        AppDimens.spaceWidth16,
        SizedBox(
          width: 120.0,
          child: TextField(
            controller: quantity,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              hintText: info.hint,
              hintStyle: const TextStyle(
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        AppDimens.spaceWidth16,
        FloatingActionButton(
            heroTag: "removeBtn",
            onPressed: () => onTimerSelectorCallback(-1),
            elevation: 4,
            backgroundColor: AppColors.grey,
            child: const Icon(
              Icons.remove,
              color: AppColors.white,
            )),
      ],
    );
  }

  Widget _buildOptions(BuildContext context) {
    List<Widget> options = [];
    options.add(const SizedBox(width: 15));
    for (var quantityOption in info.optionList) {
      options.add(FloatingActionButton(
        heroTag: "plus${quantityOption.description}}",
        onPressed: () => onTimerSelectorCallback(quantityOption.value),
        elevation: 4,
        backgroundColor: AppColors.grey,
        child: Text(
          quantityOption.description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ));
      options.add(AppDimens.spaceWidth16);
    }
    options.add(FloatingActionButton(
        heroTag: "deleteBtn",
        onPressed: () => onClearCallback(),
        elevation: 4,
        backgroundColor: AppColors.red,
        child: const Icon(
          Icons.delete,
          color: AppColors.white,
        )));
    options.add(AppDimens.spaceWidth16);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: options,
    );
  }
}
