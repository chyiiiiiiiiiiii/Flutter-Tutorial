import 'package:flutter/material.dart';
import 'package:flutter_video_project/hero/HeroPage2.dart';

import 'MyHeroArea.dart';

/// Hero Animation

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  var imgUrl =
      "https://lh3.googleusercontent.com/a-/AAuE7mBElvMDyczvexdX7s5dJqQoQ3oZZeelYAgJTLUf3to=s393-cc-rg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: MyHeroArea(
          imgUrl: imgUrl,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hero2Page()));
          },
        ),
      )),
    );
  }
}
