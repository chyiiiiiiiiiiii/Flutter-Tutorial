import 'package:flutter/material.dart';

/// AnimatedWidget - 將使用動畫效果的Widget獨立出來並繼承AnimatedWidget，以後可以重複使用
/// AnimatedWidget會自動調用addListener()和setState()
/// 使用場景：當相同Widget使用不同動畫時

class P2Page extends StatefulWidget {
  @override
  _P2PageState createState() => _P2PageState();
}

class _P2PageState extends State<P2Page> with SingleTickerProviderStateMixin {
  var imgUrl =
      "https://lh3.googleusercontent.com/a-/AAuE7mBElvMDyczvexdX7s5dJqQoQ3oZZeelYAgJTLUf3to=s292-cc-rg";

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    //
    Animation curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInCubic);
    animation = Tween(begin: 50.0, end: 200.0).animate(curvedAnimation)
      ..addStatusListener((status) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: MyAnimatedArea(animation: animation, imgUrl: imgUrl),
      )),
    );
  }
}

class MyAnimatedArea extends AnimatedWidget {
  const MyAnimatedArea({
    Key key,
    @required this.animation,
    @required this.imgUrl,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: animation.value,
      height: animation.value,
      child: Image.network(imgUrl),
    );
  }
}
