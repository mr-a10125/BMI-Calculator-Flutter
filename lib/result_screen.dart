import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {

  final int bmiResult;
  const ResultScreen({super.key, required this.bmiResult});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  var bmiColor = Colors.blue[100];
  var bmiText = "Normal";
  var bmiImg = "normal";

  void updateBmi() {
    var result = widget.bmiResult;
    setState(() {
      if(result< 18) {
        bmiText = "Underweight";
        bmiColor = Colors.blue[300];
        bmiImg = "underweight";
      } else if(result >= 18 && result <= 25) {
        bmiText = "Normal";
        bmiColor = Colors.green;
        bmiImg = "normal";
      } else if(result >= 26 && result <= 30) {
        bmiColor = Colors.yellow[400];
        bmiText = "Overweight";
        bmiImg = "overweight";
      } else if(result >= 31 && result <= 35) {
        bmiColor = Colors.orange;
        bmiText = "Obese";
        bmiImg = "obese";
      } else {
        bmiColor = Colors.red;
        bmiText = "Extreme";
        bmiImg = "extreme";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateBmi();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        shadowColor: Colors.black,
        title: Text('Result Screen', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: height/5,
            decoration: BoxDecoration(
              color: cardColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Bmi Result',
                  style: textStyle,
                ),
                Text(
                  '${widget.bmiResult}',
                  style: textStyle,
                ),
                Text(
                  bmiText,
                  style: TextStyle(
                    color: bmiColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),

          Image(
              image: AssetImage('images/$bmiImg.png'),
            height: height * 0.55,
            fit: BoxFit.fill,
          ),

          ButtonWidget(
            text: "Calculate Again",
            onPress: (){ Navigator.pop(context); },
          ),
        ],
      )
    );
  }
}

class ButtonWidget extends StatelessWidget {

  final VoidCallback onPress;
  final String text;

  const ButtonWidget({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 60.0,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor
        ),
        child:  Center(
          child: Text(
              text,
              style: textStyle
          ),
        ),
      ),
    );
  }
}
