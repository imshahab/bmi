import 'package:bmi/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_card.dart';
import 'constants.dart';
import 'dart:ui';
import 'card.dart';
import 'round_icon_button.dart';
import 'brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    backgroundColor: selectedGender == Gender.male
                        ? kCardColor
                        : kInactiveCardColor,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.mars,
                      text: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    backgroundColor: selectedGender == Gender.female
                        ? kCardColor
                        : kInactiveCardColor,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.venus,
                      text: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              backgroundColor: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Height",
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toString(),
                          textAlign: TextAlign.center,
                          style: kBigLabelTextStyle),
                      const Text(
                        " cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomButtonColor,
                      inactiveTrackColor: kCardUnselected,
                      overlayColor: const Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            MyRoundButton(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                    backgroundColor: kCardColor,
                  ),
                ),
                Expanded(
                  child: MyCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age < 99 ? age++ : age;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            MyRoundButton(
                              onTap: () {
                                setState(() {
                                  age > 18 ? age-- : age;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                    backgroundColor: kCardColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Brain brain = Brain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      numResult: brain.calculate(),
                      wordResult: brain.getResult(),
                      desc: brain.getDesc(),
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 16.0),
              height: kBottomButtonHeight,
              width: double.infinity,
              color: kBottomButtonColor,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Calculate",
                    style: kBigButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
