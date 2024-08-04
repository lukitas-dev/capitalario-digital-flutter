import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

typedef OnDropdownSelectionCallback = void Function(String selection);

class DropdownBox extends StatelessWidget {
  final String hint;
  final TextStyle? hintTextStyle;
  final List<String> itemList;
  final TextStyle? itemTextStyle;
  final OnDropdownSelectionCallback onSelect;
  final TextStyle selectedTextStyle;

  const DropdownBox({
    Key? key,
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
    )
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: Text(
        hint,
        style: hintTextStyle,
      ),
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
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
