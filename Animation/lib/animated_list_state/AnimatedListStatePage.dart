import 'package:flutter/material.dart';

/// AnimatedListState
/// 具有列表動畫的元件
/// 例子：通過點擊加號隨機生成字符串，對列表進行增加操作，通過點擊條目的刪除圖標，對列表進行刪除操作

class AnimatedListStatePage extends StatefulWidget {
  @override
  _AnimatedListStatePageState createState() => _AnimatedListStatePageState();
}

class _AnimatedListStatePageState extends State<AnimatedListStatePage>
    with SingleTickerProviderStateMixin {
  int value = 1;

  List<String> data = [];
  Tween<Offset> tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  GlobalKey<AnimatedListState> animatedKey = GlobalKey<AnimatedListState>();

  Widget animatedListItem(String text, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(tween),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 30.0),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            /// 刪除項目
            var index = data.indexOf(text);
            data.removeAt(index);
            //
            animatedKey.currentState.removeItem(index,
                (BuildContext context, Animation<double> animation) {
              return animatedListItem(text, animation);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: AnimatedList(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(12.0),
                scrollDirection: Axis.vertical,
                primary: true,
                reverse: false,
                shrinkWrap: false,
                key: animatedKey,
                initialItemCount: data.length,
                itemBuilder: (context, index, Animation<double> animation) {
                  String text = data[index];
                  return animatedListItem(text, animation);
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 新增項目
          String text = value.toString();
          data.add(text);
          int index = data.indexOf(text);
          //
          animatedKey.currentState.insertItem(index);
          //
          value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
