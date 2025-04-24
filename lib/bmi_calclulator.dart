import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class BmiCalclulator extends StatefulWidget {

  const BmiCalclulator({super.key});

  @override
  State<BmiCalclulator> createState() => _BmiCalclulatorState();
}

class _BmiCalclulatorState extends State<BmiCalclulator> {

  int heightValue = 150;
  int age = 10;
  int weight = 10;
  Color maleSelectedColor = cardColor;
  Color faMaleSelectedColor = backgroundColor;

  void selectGender(bool isMaleSelected) {
    if(isMaleSelected) {
      setState(() {
        maleSelectedColor = cardColor;
        faMaleSelectedColor = backgroundColor;
      });
    } else {
      setState(() {
        faMaleSelectedColor = cardColor;
        maleSelectedColor = backgroundColor;
      });
    }
  }

  void updateAge(bool isAdd) {
    if (isAdd) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        if (age > 1) {
          age--;
        }
      });
    }
  }

  void updateWeight(bool isAdd) {
    if(isAdd) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        if(weight > 1) {
          weight--;
        }
      });
    }
  }

  void calculateBmi() {
    var heightInMiters = heightValue/100;
    var bmi = (weight / (heightInMiters * heightInMiters)).round();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: bmi))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Bmi Calculator', style: TextStyle(color: Colors.white),),
        backgroundColor: backgroundColor,
        elevation: 5.0,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CardView(
                  onPress: (){
                    selectGender(true);
                  },
                  color: maleSelectedColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.mars,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Text(
                          'Male',
                          style: textStyle
                        )
                      ],
                    ),
                  ),
                ),
                CardView(
                  onPress: (){
                    selectGender(false);
                  },
                  color: faMaleSelectedColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.venus,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        Text(
                          'Female',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            AspectRatio(
              aspectRatio: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cardColor
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Height',
                          style: textStyle
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "$heightValue",
                              style: textStyle
                          ),
                          Text(
                              ' cm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0
                              )
                          )
                        ],
                      ),

                      Slider(
                          value: heightValue.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              heightValue = value.toInt();
                            });
                          },
                        min: 120,
                        max: 200,
                        activeColor: buttonColor,
                        inactiveColor: Colors.grey[600],
                        thumbColor: buttonColor,
                      )
                    ],
                  ),
                ),
              ),
            ),

            Row(
              children: [
                CardView(
                  onPress: (){},
                  color: cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Age',
                            style: textStyle
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                updateAge(false);
                              },
                            ),
                            Text(
                                "$age",
                                style: textStyle
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                updateAge(true);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                CardView(
                  onPress: (){},
                  color: cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Weight',
                            style: textStyle
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                updateWeight(false);
                              },
                            ),
                            Text(
                                "$weight",
                                style: textStyle
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                updateWeight(true);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            Expanded(child: SizedBox(height: 5,)),

            ButtonWidget(
              text: "Calculate",
              onPress: (){ calculateBmi(); },
            ),
          ],
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {

  final Color color;
  final Widget child;
  final VoidCallback onPress;

  const CardView({super.key, required this.color, required this.child, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1/1,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPress;

  const RoundButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints(minWidth: 30.0, minHeight: 30.0),
      shape: CircleBorder(),
      fillColor: backgroundColor,
      elevation: 5.0,
      child: Icon(icon, color: Colors.white,size: 20.0,),
    );
  }
}
