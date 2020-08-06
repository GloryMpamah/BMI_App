import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';



class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.calculateBmi, @required this.getResult, @required this.getInterpretation});

 final String calculateBmi;
 final String getResult;
 final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        getResult,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        calculateBmi,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        getInterpretation,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              width: double.infinity,
            ),
            ],
        ),
      );
  }
}
