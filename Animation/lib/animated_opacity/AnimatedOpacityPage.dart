import 'package:flutter/material.dart';

/// AnimatedOpacity

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool isChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: AnimatedOpacity(
          opacity: isChange ? 0.3 : 1.0,
          duration: Duration(milliseconds: 500),
          child: Text(
            "Hey",
            style: TextStyle(fontSize: 50.0, color: Colors.orange),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isChange = !isChange;
          });
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
