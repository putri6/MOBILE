import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              children: _generateConstraints(),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 1,
              children: _generateConstraints(),
            );
          } else {
            return GridView.count(
              crossAxisCount: 6,
              children: _generateConstraints(),
            );
          }
        },
      ),
    );
  }
  List<Widget> _generateConstraints() {
    // Generate some placeholder widgets
    return List.generate(12, (index) {
      return Container(
        margin: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 8, 35, 57).withOpacity(0.1),
        height: 200,
      );
    });
  }
}
