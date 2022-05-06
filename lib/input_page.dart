import 'package:bmicalculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputePageState createState() => _InputePageState();
}

class _InputePageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BMI Calculator'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style: labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              const Text(
                                'cm',
                                style: labelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: const SliderThemeData(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ))),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ])
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);

                  print('inkwell is tapped');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                              bmiResult: calc.calculateBMI()!,
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation())));

                  print('after navigator');
                },
                child: Container(
                  height: 60.0,
                  color: Colors.pink,
                  child: const Center(
                      child: Text(
                    'CALCULATE',
                    style: kLargeButtoTextStyle,
                  )),
                ),
              )

              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) =>ResultsPage(bmiResult: "100", resultText: "resultText", interpretation: "interpretation") ));
              //   },
              //   child: Container(
              //     color: Colors.pink,
              //     child: Text("CALCULATE"),
              //   ),
              // )// InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) =>ResultsPage(bmiResult: "100", resultText: "resultText", interpretation: "interpretation") ));
              //   },
              //   child: Container(
              //     color: Colors.pink,
              //     child: Text("CALCULATE"),
              //   ),
              // )
              // BottomButton(
              //   buttonTitle: 'CALCULATE',
              //   onTap: () {
              //     CalculatorBrain calc =
              //         CalculatorBrain(height: height, weight: weight);

              //     String bmiResult = calc.calculateBMI();
              //     String resultText = calc.getResult();
              //     String interpretation = calc.getInterpretation();

              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ResultsPage(
              //                 bmiResult: bmiResult,
              //                 resultText: resultText,
              //                 interpretation: interpretation)));
              //   },
              // ),
            ]));
  }
}
