import 'package:flutter/material.dart';

/// AnimatedBuilder
/// AnimatedBuilder會自動調用addListener()和setState()
/// 使用場景：當不同Widget使用不同動畫時

class P3Page extends StatefulWidget {
  @override
  _P3PageState createState() => _P3PageState();
}

class _P3PageState extends State<P3Page> with SingleTickerProviderStateMixin {
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
    Animation curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animation = Tween(begin: 50.0, end: 200.0).animate(curvedAnimation)
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
        child: MyAnimatedBuilder(
            child: MyLogo(imgUrl: imgUrl), animation: animation),
      )),
    );
  }
}

class MyLogo extends StatelessWidget {
  const MyLogo({
    Key key,
    @required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imgUrl);
  }
}

class MyAnimatedBuilder extends StatelessWidget {
  const MyAnimatedBuilder({
    Key key,
    @required this.child,
    @required this.animation,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: animation.value,
          height: animation.value,
          child: child,
        );
        ;
      },
      child: child,
    );
  }
}
