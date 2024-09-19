import 'package:flutter/material.dart';
import 'dart:math';
import 'colors.dart'; // Import your custom colors

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.dark4,
        appBar: AppBar(
          title: Text(
            'Dicee',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          backgroundColor: AppColors.primary500,
          foregroundColor: AppColors.light1,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    void onPress() {
      setState(() {
        leftDice = Random().nextInt(6) + 1;
        rightDice = Random().nextInt(6) + 1;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: AppColors.primary500,
              padding: EdgeInsets.all(20.0),
              width: 200.0,
              child: TextButton(
                onPressed: onPress,
                child: Image.asset('images/dice$leftDice.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Divider(
          indent: 50.0,
          endIndent: 50.0,
          color: AppColors.primary600,
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: AppColors.primary500,
              padding: EdgeInsets.all(20.0),
              // margin: EdgeInsets.all(20.0),
              width: 200.0,
              child: TextButton(
                onPressed: onPress,
                child: Image.asset('images/dice$rightDice.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
