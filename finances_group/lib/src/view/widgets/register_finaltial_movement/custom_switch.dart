import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  bool valueSwitch;
  CustomSwitch({
    Key? key,
    required this.valueSwitch,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.blue,
        inactiveTrackColor: Colors.pink,
        value: widget.valueSwitch,
        onChanged: (value) {
          widget.valueSwitch = value;
          setState(() {});
        });
  }
}
