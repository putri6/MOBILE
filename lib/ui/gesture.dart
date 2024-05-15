import 'package:flutter/material.dart';

class GestureScreen extends StatefulWidget {
  const GestureScreen({Key? key}) : super(key: key);

  @override
  State<GestureScreen> createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  final double boxSize = 200;
  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  double posX = 0;
  double posY = 0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0 && posY == 0) {
      centeredContainer();
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  posX += details.delta.dx;
                  posY += details.delta.dy;
                });
              },
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
        ],
      ),
      bottomNavigationBar: Text(
        'Tap: $numOfSingleTap - Double Taps: $numOfDoubleTap - Long Press: $numOfLongPress',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  void centeredContainer() {
    setState(() {
      posX = (MediaQuery.of(context).size.width - boxSize) / 2;
      posY = (MediaQuery.of(context).size.height - boxSize) / 2 - 90;
    });
  }
}
