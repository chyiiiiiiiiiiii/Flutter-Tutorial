import 'package:flutter/material.dart';

class P1Page extends StatefulWidget {
  @override
  _P1PageState createState() => _P1PageState();
}

class _P1PageState extends State<P1Page> with SingleTickerProviderStateMixin {
  var imgUrl =
      "https://lh3.googleusercontent.com/a-/AAuE7mBElvMDyczvexdX7s5dJqQoQ3oZZeelYAgJTLUf3to=s192-cc-rg";

  AnimationController animationController;
  Animation animation;

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
      ..addListener(() {
        setState(() {});
      })
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
        child: Container(
          width: animation.value,
          height: animation.value,
          child: Image.network(imgUrl),
        ),
      )),
    );
  }
}
