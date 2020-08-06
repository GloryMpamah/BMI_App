import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'first_row_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';


enum Gender {
  Male,
  Female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  int height = 180;
  int weight = 74;
  int age = 25;

//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//
//  void updateColor(int gender) {
//    if (gender == 1) {
//      if (maleCardColor == inactiveCardColor)
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//    } else {
//      maleCardColor = inactiveCardColor;
//    }
//
//    if (gender == 2) {
//      if(femaleCardColor == inactiveCardColor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      } else {
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  colour: selectedGender == Gender.Male
                  ? kActiveCardColor
                  : kInactiveCardColor,
                        cardChild: FirstRowContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
              ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  colour: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                      cardChild: FirstRowContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                      ),
              ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                          'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }
                    ),
                  ),
                ],
              ),
                colour: kActiveCardColor
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                                weight.toString(),
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                    icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(width: 10,),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kActiveCardColor
              ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      calculateBmi: calc.calculateBmi(),
                    getResult: calc.getResult(),
                    getInterpretation: calc.getInterpretation(),
                  ),
              ),
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                      'CALCULATE YOUR BMI',
                  ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              color: kBottomContainerColor,
             height: kBottomContainerHeight,
              width: double.infinity,

            ),
          )
        ],
      )
      );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}






