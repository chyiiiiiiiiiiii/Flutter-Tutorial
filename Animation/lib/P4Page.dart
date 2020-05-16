import 'package:flutter/material.dart';

///

class P4Page extends StatefulWidget {
  @override
  _P4PageState createState() => _P4PageState();
}

class _P4PageState extends State<P4Page> with SingleTickerProviderStateMixin {
  var imgUrl =
      "https://lh3.googleusercontent.com/a-/AAuE7mBElvMDyczvexdX7s5dJqQoQ3oZZeelYAgJTLUf3to=s393-cc-rg";

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //
    animation =
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
        child: MyAnimationArea(animation: animation, imgUrl: imgUrl),
      )),
    );
  }
}

class MyAnimationArea extends AnimatedWidget {
  static final _opacityAnimation = Tween(begin: 0.1, end: 1.0);
  static final _sizeAnimation = Tween(begin: 50.0, end: 200.0);

  const MyAnimationArea({
    Key key,
    @required this.animation,
    @required this.imgUrl,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityAnimation.evaluate(animation),
      child: Container(
        width: _sizeAnimation.evaluate(animation),
        height: _sizeAnimation.evaluate(animation),
        child: Image.network(imgUrl),
      ),
    );
  }
}
