import 'package:bmi_calculator_ntv/calculator_brain.dart';
import 'package:bmi_calculator_ntv/screens/results_page.dart';
import 'package:bmi_calculator_ntv/widgets/bottom_button.dart';
import 'package:bmi_calculator_ntv/widgets/label_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/action_card.dart';
import '../widgets/icon_label.dart';

enum Gender { FEMALE, MALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 80;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color(0xFF0A0D22),
        title: const Center(
            child: Text('BMI CALCULATOR')
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ActionCard(
                      onPressed: () => setState(() => gender = Gender.MALE),
                      color: gender == Gender.MALE
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconLabel(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActionCard(
                      onPressed: () => setState(() => gender = Gender.FEMALE),
                      color: gender == Gender.FEMALE
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconLabel(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ActionCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kValueTextStyle),
                       const Text('cm', style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.red,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: kAccentColor,
                        thumbShape:
                           const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                        overlayColor: const Color(0x29EB1555),
                        overlayShape:
                           const RoundSliderOverlayShape(overlayRadius: 32.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) => setState(() {
                          height = newValue.toInt();
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ActionCard(
                      color: kActiveCardColor,
                      child: LabelButtons(
                        'WEIGHT',
                        value: weight,
                        minValue: 30,
                        unit: 'kg',
                        onPressed: (newValue) => weight = newValue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActionCard(
                      color: kActiveCardColor,
                      child: LabelButtons(
                        'AGE',
                        value: age,
                        minValue: 0,
                        onPressed: (newValue) => age = newValue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              'CALCULATE YOUR BMI',
              onPressed: () {
                CalculatorBrain calc = CalculatorBrain();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: calc.getBMI(height, weight),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                      resultColor: calc.getResultColor(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
