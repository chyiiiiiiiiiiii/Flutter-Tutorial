import 'package:flutter/material.dart';

/// AnimatedContainer
/// 跟一般的Container一樣，只是setState更新屬性後，在更新UI的過程會有動畫
/// 自動在屬性的舊值和新值之間設置動畫

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  var imgUrl =
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/friendliest-dog-breeds-golden-1578596627.jpg?crop=0.668xw:1.00xh;0.188xw,0&resize=640:*";

  var isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isUpdate = !isUpdate;
            });
          },
          child: AnimatedContainer(
            width: isUpdate == true ? 300.0 : 100.0,
            height: isUpdate == true ? 300.0 : 100.0,
            decoration: BoxDecoration(
                color:
                    isUpdate == true ? Colors.lightGreenAccent : Colors.orange,
                borderRadius: isUpdate == true
                    ? BorderRadius.circular(10.0)
                    : BorderRadius.circular(50.0)),
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
          ),
        ),
      ),
    );
  }
}
