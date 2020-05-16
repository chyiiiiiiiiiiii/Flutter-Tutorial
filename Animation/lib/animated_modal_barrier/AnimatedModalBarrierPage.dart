import 'package:flutter/material.dart';

/// AnimatedModalBarrier
/// 1.防止用戶與Widget後面的widgets互動，可以配置一個有動畫的顏色值。
/// 2.與ModalBarrier類似，AnimatedModalBarrier接收一個有動畫的color，而不是某些顏色。

///	Ex. 當屏幕上出現對話框時，對話框下方的頁面通常會被ModalBarrier變暗

class AnimatedModalBarrierPage extends StatefulWidget {
  @override
  _AnimatedModalBarrierPageState createState() =>
      _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AnimationController animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    Animation<Color> animation =
        ColorTween(begin: Colors.orange, end: Colors.blueAccent)
            .animate(animationController);
    animationController.forward();
    //
    return Scaffold(
      body: Center(
          child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 600,
              child: AnimatedModalBarrier(
                color: animation,
                dismissible: true,
                semanticsLabel: "Barrier",
                barrierSemanticsDismissible: true,
              ),
            ),
            Text(
              "How are you?",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      )),
    );
  }
}
