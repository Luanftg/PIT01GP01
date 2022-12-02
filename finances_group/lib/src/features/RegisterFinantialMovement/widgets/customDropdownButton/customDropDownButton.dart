// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finances_group/src/features/RegisterFinantialMovement/register_finantial_movement_page.dart';
import 'package:flutter/material.dart';

//List<String> list = ['Vermelho', 'Azul', 'Amarelo', 'Verde'];

class CustomDropDownButton extends StatefulWidget {
  final List<String> list;

  const CustomDropDownButton({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String dropDownValue = 'Vermelho';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Object>(
      value: dropDownValue,
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
          RegisterFinantialMovementPage.colorString = value.toString();
          dropDownValue = value.toString();
        });
      },
    );
  }
}
