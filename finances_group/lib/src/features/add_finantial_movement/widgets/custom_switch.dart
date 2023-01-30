import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);

  static ValueNotifier<bool> valueSwitch = ValueNotifier(false);
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  void initState() {
    super.initState();
    CustomSwitch.valueSwitch.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Despesa'),
        Switch(
            activeColor: AppCustomColors.cyan,
            inactiveTrackColor: AppCustomColors.danger,
            value: CustomSwitch.valueSwitch.value,
            onChanged: (value) {
              CustomSwitch.valueSwitch.value = value;
            }),
        const Text('Receita'),
      ],
    );
  }
}
