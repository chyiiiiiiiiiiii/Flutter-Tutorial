import 'package:flutter/material.dart';
import 'package:flutter_video_project/animated_default_text_style/AnimatedTextStylePage.dart';
import 'package:flutter_video_project/animated_list_state/AnimatedListStatePage.dart';
import 'package:flutter_video_project/animated_modal_barrier/AnimatedModalBarrierPage.dart';
import 'package:flutter_video_project/animated_opacity/AnimatedOpacityPage.dart';
import 'package:flutter_video_project/animated_physical_model/AnimatedPhysicalModelPage.dart';
import 'package:flutter_video_project/decorated_box_transition/DecoratedBoxTransitionPage.dart';
import 'package:flutter_video_project/P4Page.dart';
import 'package:flutter_video_project/animated_container/AnimatedContainerPage.dart';
import 'package:flutter_video_project/hero/HeroPage.dart';
import 'package:flutter_video_project/radial_hero/RadialHeroPage.dart';
import 'package:flutter_video_project/staggered/StaggeredPage.dart';

import 'P1Page.dart';
import 'P2Page.dart';
import 'P3Page.dart';
import 'animated_cross_fade/AnimatedCrossFade.dart';
import 'animated_positioned/AnimatedPositionedPage.dart';
import 'animated_size/AnimatedSizePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                    child: Text("P1"),
                    onPressed: () {
                      push(context, P1Page());
                    }),
                RaisedButton(
                    child: Text("P2"),
                    onPressed: () {
                      push(context, P2Page());
                    }),
                RaisedButton(
                    child: Text("P3"),
                    onPressed: () {
                      push(context, P3Page());
                    }),
                RaisedButton(
                    child: Text("P4"),
                    onPressed: () {
                      push(context, P4Page());
                    }),
                RaisedButton(
                    child: Text("Hero"),
                    onPressed: () {
                      push(context, HeroPage());
                    }),
                RaisedButton(
                    child: Text("RadialHero"),
                    onPressed: () {
                      push(context, RadialHeroPage());
                    }),
                RaisedButton(
                    child: Text("Staggered"),
                    onPressed: () {
                      push(context, StaggeredPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedContainer"),
                    onPressed: () {
                      push(context, AnimatedContainerPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedCrossFade"),
                    onPressed: () {
                      push(context, AnimatedCrossFadePage());
                    }),
                RaisedButton(
                    child: Text("DecoratedBoxTransition"),
                    onPressed: () {
                      push(context, DecoratedBoxTransitionPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedDefaultTextStyle"),
                    onPressed: () {
                      push(context, AnimatedDefaultTextStylePage());
                    }),
                RaisedButton(
                    child: Text("AnimatedOpacity"),
                    onPressed: () {
                      push(context, AnimatedOpacityPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedPhysicalModel"),
                    onPressed: () {
                      push(context, AnimatedPhysicalModelPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedModalBarrier"),
                    onPressed: () {
                      push(context, AnimatedModalBarrierPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedPositioned"),
                    onPressed: () {
                      push(context, AnimatedPositionedPage());
                    }),
                RaisedButton(
                    child: Text("AnimatedSize"),
                    onPressed: () {
                      push(context, AnimatedSizePage());
                    }),
                RaisedButton(
                    child: Text("AnimatedListState"),
                    onPressed: () {
                      push(context, AnimatedListStatePage());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
