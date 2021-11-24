import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_starter/components/sliding_segmented_control.dart';
/*
SegmentedSelector(
                menuOptions: list of dropdown options in key value pairs,
                selectedOption: menu option string value,
                onChanged: (value) => print('changed'),
              ),
*/

class SegmentedSelector extends StatelessWidget {
  SegmentedSelector(
      {required this.menuOptions,
      required this.selectedOption,
      required this.onValueChanged});

  final List<dynamic> menuOptions;
  final String selectedOption;
  final void Function(dynamic) onValueChanged;

  @override
  Widget build(BuildContext context) {
    //if (Platform.isIOS) {}

    return CupertinoSlidingSegmentedControl(
        //thumbColor: Theme.of(context).primaryColor,
        groupValue: selectedOption,
        children: { for (var option in menuOptions) option.key : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(option.icon),
              SizedBox(width: 6),
              Text(option.value),
            ],
          ) },
        onValueChanged: onValueChanged);
  }
}
