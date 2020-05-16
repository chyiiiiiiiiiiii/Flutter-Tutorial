import 'package:flutter/material.dart';

/// Staggered Animation - 交錯動畫
/// 透過CurvedAnimation裡面設置Interval，來決定動畫的時間要佔總時長多久

class StaggeredPage extends StatefulWidget {
  @override
  _StaggeredPageState createState() => _StaggeredPageState();
}

class _StaggeredPageState extends State<StaggeredPage>
    with SingleTickerProviderStateMixin {
  var imgUrl =
      "https://lh3.googleusercontent.com/a-/AAuE7mBElvMDyczvexdX7s5dJqQoQ3oZZeelYAgJTLUf3to=s393-cc-rg";

  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //
    CurvedAnimation(parent: animationController, curve: Curves.bounceInOut)
      ..addStatusListener((status) {
        // 達到無限執行的效果
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    //
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StaggeredAnimationArea(
            animationController: animationController, imgUrl: imgUrl),
      )),
    );
  }
}

class StaggeredAnimationArea extends StatelessWidget {
  const StaggeredAnimationArea({
    Key key,
    @required this.child,
    @required this.animationController,
    @required this.imgUrl,
  }) : super(key: key);

  final Widget child;
  final AnimationController animationController;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    /// 1.
    var opacityTween = Tween<double>(begin: 0.1, end: 1.0);
    var curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Interval(0.100, 0.250, curve: Curves.easeIn));
    Animation<double> opacityAnimation = opacityTween.animate(curvedAnimation);

    /// 2.
    var sizeTween = Tween<double>(begin: 50.0, end: 200.0);
    curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Interval(0.300, 0.500, curve: Curves.easeIn));
    Animation<double> sizeAnimation = sizeTween.animate(curvedAnimation);

    /// 3.
    var borderRadiusTween = BorderRadiusTween(
        begin: BorderRadius.circular(5.0), end: BorderRadius.circular(30.0));
    curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Interval(0.550, 0.750, curve: Curves.easeIn));
    Animation<BorderRadius> borderRadiusAnimation =
        borderRadiusTween.animate(curvedAnimation);

    /// 4.
    var colorTween =
        ColorTween(begin: Colors.lightBlueAccent, end: Colors.orangeAccent);
    curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Interval(0.750, 1.0, curve: Curves.easeIn));
    Animation<Color> colorAnimation = colorTween.animate(curvedAnimation);
    //
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Opacity(
            opacity: opacityAnimation.value,
            child: Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              decoration: BoxDecoration(
                  borderRadius: borderRadiusAnimation.value,
                  color: colorAnimation.value),
              child: Image.network(imgUrl),
            ),
          );
        });
  }
}
