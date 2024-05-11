import 'package:flutter/material.dart';

class Gesture_screen extends StatefulWidget {
  const Gesture_screen({Key? key}) : super(key: key);

  @override
  State<Gesture_screen> createState() => _Gesture_screenState();
}

class _Gesture_screenState extends State<Gesture_screen> {
  final double boxSize = 200;
  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              numOfSingleTap++;
            });
          },
          onDoubleTap: () {
            setState(() {
              numOfDoubleTap++;
            });
          },
          onLongPress: () {
            setState(() {
              numOfLongPress++;
            });
          },
          child: Container(
            width: boxSize,
            height: boxSize,
            color: Colors.amber,
          ),
        ),
      ),
      bottomNavigationBar: Text(
        'Tap: $numOfSingleTap - Double Taps: $numOfDoubleTap - Long Press: $numOfLongPress',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
