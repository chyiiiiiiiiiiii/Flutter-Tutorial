import 'package:flutter/material.dart';

class MyHeroArea extends StatelessWidget {
  const MyHeroArea(
      {Key key,
      this.heroTag = "hero",
      @required this.imgUrl,
      this.size = 200.0,
      this.isCircular = false,
      this.onTap})
      : super(key: key);

  final String heroTag;
  final String imgUrl;
  final double size;
  final bool isCircular;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Hero(
          tag: heroTag,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: isCircular
                  ? ClipOval(
                      child: Image.network(
                      imgUrl,
                    ))
                  : Image.network(
                      imgUrl,
                    ),
              onTap: onTap,
            ),
          )),
    );
  }
}
