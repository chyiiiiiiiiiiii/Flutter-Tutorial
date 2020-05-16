import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_video_project/radial_hero/RadialHeroPage2.dart';

/// Radial Hero Animation
/// 第一個頁面包含正方形的元件跳轉到第二個頁面是圓形元件

class RadialHeroPage extends StatefulWidget {
  @override
  _RadialHeroPageState createState() => _RadialHeroPageState();
}

class _RadialHeroPageState extends State<RadialHeroPage> {
  var imgUrl =
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/friendliest-dog-breeds-golden-1578596627.jpg?crop=0.668xw:1.00xh;0.188xw,0&resize=640:*";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: RadialExpansion(
          maxRadius: 200.0,
          child: Image.network(imgUrl),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RadialHero2Page()));
          },
        ),
      )),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion(
      {Key key, this.heroTag = "hero", this.maxRadius, this.child, this.onTap})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final String heroTag;
  final double maxRadius;
  final clipRectSize;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    /// 這邊的寫法是由正方形到圓形，注意ClipOval跟ClipRect，顛倒就元件互換
    return Hero(
      tag: heroTag,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: ClipOval(
            child: Center(
              child: SizedBox(
                width: clipRectSize,
                height: clipRectSize,
                child: ClipRect(
                  child: child, // Photo
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
