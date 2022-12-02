import 'dart:developer';

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
        activeColor: Colors.blue,
        inactiveTrackColor: Colors.pink,
        value: CustomSwitch.valueSwitch,
        onChanged: (value) {
          log('value: $value');
          setState(() {
            log('value $value');
            // RegisterFinantialMovementPage.valueSwitch =
            CustomSwitch.valueSwitch = value;
            //     valueSwitch ? true : false;
          });
          //log('Register.valueSwitch : $valueSwitch');
          log('valueSwitch : $CustomSwitch.valueSwitch');
        });
  }
}
