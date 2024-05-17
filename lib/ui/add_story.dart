import 'dart:math';
import 'package:flutter/material.dart';

// Generate a random border radius between 0 and 50
double randomBorderRadius() {
  return Random().nextDouble() * 50;
}

// Generate a random margin between 0 and 20
double randomMargin() {
  return Random().nextDouble() * 20;
}

// Generate a random color
Color randomColor() {
  return Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
}

class Addstory extends StatefulWidget {
  const Addstory({super.key});

  @override
  State<Addstory> createState() => _AddstoryState();
}

class _AddstoryState extends State<Addstory> {
  late double borderRadius;
  late double margin;
  late Color color;
  double posX = 0;
  double posY = 0;
  final double boxSize = 100;

  @override
  void initState() {
    super.initState();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
    color = randomColor();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    centeredContainer();
  }

  void changeState() {
    setState(() {
      borderRadius = randomBorderRadius();
      margin = randomMargin();
      color = randomColor();
    });
  }

  void centeredContainer() {
    final mediaQuery = MediaQuery.of(context);
    setState(() {
      posX = (mediaQuery.size.width - boxSize) / 2;
      posY = (mediaQuery.size.height - boxSize) / 2 - 90;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: posX,
              top: posY,
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    posX += details.delta.dx;
                    posY += details.delta.dy;
                  });
                },
                onTap: changeState,
                child: SizedBox(
                  width: boxSize,
                  height: boxSize,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.bounceIn,
                    margin: EdgeInsets.all(margin),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Addstory(),
  ));
}
