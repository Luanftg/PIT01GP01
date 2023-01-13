import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> list;

  const CustomDropDownButton({
    Key? key,
    required this.list,
  }) : super(key: key);

  static String? dropDownValue;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: CustomDropDownButton.dropDownValue,
      hint: widget.list.isEmpty
          ? const CircularProgressIndicator()
          : Text(widget.list[0]),
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(5),
      enableFeedback: true,
      onChanged: (value) {
        setState(() {
          CustomDropDownButton.dropDownValue = value.toString();
        });
      },
    );
  }
}
