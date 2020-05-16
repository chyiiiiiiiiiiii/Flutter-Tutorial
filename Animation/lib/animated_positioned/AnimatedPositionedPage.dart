import 'package:flutter/material.dart';

/// AnimatedPositioned
/// 具有位置變化動畫的元件

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage>
    with SingleTickerProviderStateMixin {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        onTap: () {
          setState(() {
            isChanged = !isChanged;
          });
        },
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedPositioned(
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  color: Colors.green,
                ),
                duration: Duration(seconds: 1),
                left: isChanged ? 20.0 : 100.0,
                top: isChanged ? 50.0 : 100.0,
                curve: Curves.easeInOut,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
