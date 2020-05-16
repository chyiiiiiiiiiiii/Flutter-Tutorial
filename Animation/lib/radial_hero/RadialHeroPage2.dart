import 'package:flutter/material.dart';
import 'package:flutter_video_project/hero/MyHeroArea.dart';

/// Hero Animation

class RadialHero2Page extends StatefulWidget {
  @override
  _RadialHero2PageState createState() => _RadialHero2PageState();
}

class _RadialHero2PageState extends State<RadialHero2Page> {
  var imgUrl =
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/friendliest-dog-breeds-golden-1578596627.jpg?crop=0.668xw:1.00xh;0.188xw,0&resize=640:*";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MyHeroArea(
        imgUrl: imgUrl,
        size: 100.0,
        isCircular: true,
        onTap: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
