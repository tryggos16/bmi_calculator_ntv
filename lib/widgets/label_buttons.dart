import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class LabelButtons extends StatefulWidget {
  final int value, minValue, maxValue;
  final String title, unit;
  final Function onPressed;

  LabelButtons(
    this.title, {
    @required this.value,
    this.minValue = 0,
    this.maxValue,
    this.unit = '',
    this.onPressed,
  });

  int getValue() {
    return value;
  }

  @override
  _LabelButtonsState createState() => _LabelButtonsState(
        value,
        minValue,
        maxValue,
        title,
        unit,
        onPressed,
      );
}

class _LabelButtonsState extends State<LabelButtons> {
  int value, minValue, maxValue;
  String title, unit;
  Function onPressed;

  _LabelButtonsState(
    this.value,
    this.minValue,
    this.maxValue,
    this.title,
    this.unit,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: kLabelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(value.toString(), style: kValueTextStyle),
            Text(unit, style: kLabelTextStyle),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () => setState(() {
                if (value > minValue) {
                  value--;
                  _postValue();
                }
              }),
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () => setState(() {
                if (maxValue != null && value >= maxValue) {
                  return;
                }
                value++;
                _postValue();
              }),
            ),
          ],
        )
      ],
    );
  }

  void _postValue() {
    if (onPressed != null) {
      onPressed(value);
    }
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  RoundIconButton({@required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF1C2033),
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
    );
  }
}
