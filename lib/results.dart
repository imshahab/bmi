import 'package:flutter/material.dart';
import 'card.dart';
import 'constants.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.wordResult, required this.numResult, required this.desc});

  final String wordResult;
  final String numResult;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(32.0, 64.0, 16.0, 16.0),
                child: const Text(
                  "Your Results",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: MyCard(
                backgroundColor: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      wordResult,
                      style: kResultWordTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 64.0,
                    ),
                    Text(
                      numResult,
                      textAlign: TextAlign.center,
                      style: kResultTextStyle,
                    ),
                    const SizedBox(height: 64.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: kDescTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
                      "Recalculate",
                      style: kBigButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
