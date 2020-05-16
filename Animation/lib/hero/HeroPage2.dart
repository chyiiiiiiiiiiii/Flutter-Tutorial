import 'package:flutter/material.dart';
import 'MyHeroArea.dart';

/// Hero Animation

class Hero2Page extends StatefulWidget {
  @override
  _Hero2PageState createState() => _Hero2PageState();
}

class _Hero2PageState extends State<Hero2Page> {
  var imgUrl =
      "https://lh3.googleusercontent.com/a-/AAuE7mBElvMDyczvexdX7s5dJqQoQ3oZZeelYAgJTLUf3to=s393-cc-rg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MyHeroArea(
        imgUrl: imgUrl,
        size: 100.0,
        onTap: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
