import 'package:flutter/material.dart';

import '../constants.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  IconLabel({@required this.icon, @required this.label, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: color,
        ),
       const SizedBox(
          height: 12.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
