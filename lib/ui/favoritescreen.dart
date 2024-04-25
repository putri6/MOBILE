import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Screen size: ${screenSize.width.toStringAsFixed(2)}',
              style: TextStyle(color: Color.fromARGB(255, 104, 27, 27), fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              'Screen Orientation: $screenOrientation',
              style: TextStyle(color: Color.fromARGB(255, 125, 7, 7), fontSize: 18),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
