import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

typedef OnDropdownSelectionCallback = void Function(String selection);

class DropdownBox extends StatelessWidget {
  final Color arrowColor;
  final Color backgroundColor;
  final Color selectionListBackgroundColor;
  final String hint;
  final TextStyle? hintTextStyle;
  final List<String> itemList;
  final TextStyle? itemTextStyle;
  final OnDropdownSelectionCallback onSelect;
  final TextStyle selectedTextStyle;

  const DropdownBox(
      {Key? key,
      this.arrowColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.selectionListBackgroundColor = Colors.white,
      required this.hint,
      this.hintTextStyle = const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      required this.itemList,
      this.itemTextStyle = const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      required this.onSelect,
      this.selectedTextStyle = const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      alignment: Alignment.center,
      decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: backgroundColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: backgroundColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: backgroundColor))),
      hint: Align(
          alignment: Alignment.center,
          child: Text(
            hint,
            style: hintTextStyle,
          )),
      items: itemList
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: itemTextStyle,
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Por favor selecione algum!';
        }
        return null;
      },
      onChanged: (value) {
        onSelect(value.toString());
      },
      selectedItemBuilder: (BuildContext context) {
        return itemList.map((String value) {
          return Text(
            value,
            style: selectedTextStyle,
          );
        }).toList();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: arrowColor,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: selectionListBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
