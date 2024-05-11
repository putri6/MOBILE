import 'package:flutter/material.dart';

class Addstory extends StatelessWidget {
  const Addstory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 'image_animation',
        child: Image.asset('assets/bg.jpg'),
      ),
    );
  }
}
