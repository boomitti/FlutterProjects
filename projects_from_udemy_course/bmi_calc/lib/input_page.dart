import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card_content.dart';

const double bottomContainerHeight = 80.0;
const Color bottomContainerColor = Colors.redAccent;
const Color reusableCardColor = Color(0xff1d1e33);
const Color inactiveCardColor = Color.fromARGB(255, 18, 18, 31);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                        cardColor: selectedGender == Gender.male
                            ? reusableCardColor
                            : inactiveCardColor,
                        cardContent: GenderCardContent(
                          genderIcon: FontAwesomeIcons.mars,
                          iconText: 'MALE',
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
                        cardColor: selectedGender == Gender.female
                            ? reusableCardColor
                            : inactiveCardColor,
                        cardContent: GenderCardContent(
                          genderIcon: FontAwesomeIcons.venus,
                          iconText: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: reusableCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: reusableCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: reusableCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 16.0),
            )
          ],
        ));
  }
}
