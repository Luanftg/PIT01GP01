import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> list;

  const CustomDropDownButton({
    Key? key,
    required this.list,
  }) : super(key: key);

  static String dropDownValue = 'Vermelho';
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Object>(
      value: CustomDropDownButton.dropDownValue,
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
          // RegisterFinantialMovementPage.colorString = value.toString();
          CustomDropDownButton.dropDownValue = value.toString();
        });
      },
    );
  }
}
