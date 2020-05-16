import 'package:flutter/material.dart';

/// AnimatedSize
/// 具有尺寸變化動畫的元件

class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage>
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
          child: AnimatedSize(
            duration: Duration(milliseconds: 500),
            vsync: this,
            alignment: Alignment.center,
            curve: Curves.easeInOutCirc,
            child: FlutterLogo(
              size: isChanged ? 200.0 : 100.0,
            ),
          ),
        ),
      )),
    );
  }
}
