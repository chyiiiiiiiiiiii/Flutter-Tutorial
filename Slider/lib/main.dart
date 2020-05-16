import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                "我的數值${value.toInt()}",
                style: TextStyle(color: Colors.green, fontSize: 30.0),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.red.withOpacity(0.3),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Colors.red,
                    overlayColor: Colors.red.withOpacity(0.2)),
                child: Slider(
                    value: value,
                    min: 1,
                    max: 100,
                    onChanged: (nv) {
                      setState(() {
                        value = nv;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
