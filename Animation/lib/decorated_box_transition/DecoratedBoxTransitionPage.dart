import 'package:flutter/material.dart';

/// DecoratedBoxTransition
/// 邊框動畫，可以通過控制器去控制動畫邊框值的改變，從而控制動畫邊框，通常都包著Container
/// 一樣透過AnimationController控制

class DecoratedBoxTransitionPage extends StatefulWidget {
  @override
  _DecoratedBoxTransitionPageState createState() =>
      _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Decoration> decorationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    //
    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    decorationAnimation = DecorationTween(
            begin: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
            end: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(50.0)))
        .animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) {
              animationController.reverse();
            } else if (s == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    //
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DecoratedTransition(
            child: FlutterLogo(
              style: FlutterLogoStyle.markOnly,
              size: 200.0,
            ),
            decorationAnimation: decorationAnimation),
      ),
    );
  }
}

class DecoratedTransition extends StatelessWidget {
  const DecoratedTransition({
    Key key,
    @required this.child,
    @required this.decorationAnimation,
  }) : super(key: key);

  final Widget child;
  final Animation<Decoration> decorationAnimation;

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
        decoration: decorationAnimation,
        child: Container(
          decoration: decorationAnimation.value,
          child: child,
        ));
  }
}
