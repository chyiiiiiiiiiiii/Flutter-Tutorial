import 'package:flutter/material.dart';

/// AnimatedDefaultTextStyle
/// 可以設置以下任何屬性的動畫效果：顏色，字體大小，字體粗細，字母間距，單詞間距，高度，字體系列等等

class AnimatedDefaultTextStylePage extends StatefulWidget {
  @override
  _AnimatedDefaultTextStylePageState createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  double size = 20.0;
  bool isGreen = true;
  bool isBold = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: AnimatedDefaultTextStyle(
          child: Text("Hello"),
          style: TextStyle(
              fontSize: size,
              color: isGreen ? Colors.blueAccent : Colors.orangeAccent,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            size += 5;
            isGreen = !isGreen;
            isBold = !isBold;
          });
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
