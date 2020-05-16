import 'package:flutter/material.dart';

/// AnimatedPhysicalModel

class AnimatedPhysicalModelPage extends StatefulWidget {
  @override
  _AnimatedPhysicalModelPageState createState() =>
      _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
  bool isChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedPhysicalModel(
        color: isChange ? Colors.blue : Colors.orange,
        elevation: isChange ? 5.0 : 20.0,
        shadowColor: isChange ? Colors.grey : Colors.red,
        shape: isChange ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isChange
            ? BorderRadius.circular(10.0)
            : BorderRadius.circular(30.0),
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Hey",
            style: TextStyle(fontSize: 50.0, color: Colors.white),
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
