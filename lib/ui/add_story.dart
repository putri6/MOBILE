import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


double randomBorderRadius() {
  return Random().nextDouble() * 50;
}


double randomMargin() {
  return Random().nextDouble() * 20;
}


Color randomColor() {
  return Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
}

class Addstory extends StatefulWidget {
  const Addstory({Key? key}) : super(key: key);

  @override
  State<Addstory> createState() => _AddstoryState();
}

class _AddstoryState extends State<Addstory> {
  late double borderRadius;
  late double margin;
  late String imageUrl; // Store image URL
  double posX = 0;
  double posY = 0;
  final double boxSize = 100;
  double scale = 1.0;
  double opacity = 1.0;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
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
      scale = 1.2; 
      opacity = 0.7; 
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scale = 1.0; 
        opacity = 1.0; 
      });
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
      appBar: AppBar(title: const Text("Hover and Animations")),
      backgroundColor: const Color(0xFF3B6D83),
      body: Center(
        child: SafeArea(
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
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: isHovered ? 0.7 : 1.0,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.all(margin),
                        transform: Matrix4.diagonal3Values(
                          isHovered ? 1.2 : 1.0, 
                          isHovered ? 1.2 : 1.0, 
                          1.0
                        ),
                        decoration: BoxDecoration(
                          color: randomColor(),
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        width: boxSize,
                        height: boxSize,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: Image.network(
                            'https://awsimages.detik.net.id/community/media/visual/2022/05/03/kawasan-wisata-kawah-putih-1_169.jpeg?w=1200',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

