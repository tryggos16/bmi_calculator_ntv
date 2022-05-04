import 'package:bmi_calculator_ntv/constants.dart';
import 'package:bmi_calculator_ntv/widgets/action_card.dart';
import 'package:bmi_calculator_ntv/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmi, resultText, interpretation;
  final Color resultColor;


  ResultsPage({
    @required this.bmi,
    @required this.resultText,
    @required this.interpretation,
    this.resultColor = kResultColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const  EdgeInsets.all(16.0),
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ActionCard(
              color: kInactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: resultColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(bmi, style: kBMITextStyle),
                  Column(
                    children: const <Widget>[
                      Text('Normal BMI range:', style: kBMIRangeTextStyle),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '18.5 - 25 kg/m²',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(
                        color: resultColor,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            'RE-CALCULATE YOUR BMI',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
