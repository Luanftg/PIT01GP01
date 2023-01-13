import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);

  static bool valueSwitch = false;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: AppCustomColors.cyan,
        inactiveTrackColor: AppCustomColors.danger,
        value: CustomSwitch.valueSwitch,
        onChanged: (value) {
          setState(() {
            CustomSwitch.valueSwitch = value;
          });
        });
  }
}
