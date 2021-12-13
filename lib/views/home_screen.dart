import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speedodashboard/views/constants.dart';
import 'package:speedodashboard/views/widgets.dart';
import 'dart:math';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isWalking = false;
  Timer? _clockTimer;
  Color? newColor = Colors.blueAccent;
  double speed = 0;
  var rng = Random();
  _randomColorFun() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        speed = rng.nextInt(140).toDouble() + 10;
        print(speed);
      });
    });
  }

  _stopTimer() {
    _clockTimer!.cancel();
  }

  _stopWalk() {
    setState(() {
      _isWalking = !_isWalking;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: GestureDetector(
        onTap: () {
          if (_isWalking == true) {
            _stopTimer();
          } else {
            _randomColorFun();
          }
          _stopWalk();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1, child: Container(child: row1())),
              Flexible(flex: 1, child: Container(child: row2())),
              Flexible(flex: 1, child: Container(child: row3())),
            ],
          ),
        ),
      ),
    );
  }

  Widget row2() {
    return Container(
        height: 250,
        padding: EdgeInsets.all(10),
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/speed.png')),
          color: color5,
          shape: BoxShape.circle,
        ),
        child: _getRadialGauge());
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        title: const GaugeTitle(
            text: '',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
              axisLineStyle: const AxisLineStyle(
                thickness: 0.0,
                thicknessUnit: GaugeSizeUnit.factor,
                color: Colors.blueAccent,
              ),
              minimum: 0,
              maximum: 150,
              // ranges: <GaugeRange>[
              //   GaugeRange(
              //       startValue: 0,
              //       endValue: 50,
              //       color: Colors.black.withOpacity(0.1),
              //       startWidth: 10,
              //       endWidth: 10),
              //   GaugeRange(
              //       startValue: 50,
              //       endValue: 100,
              //       color: Colors.deepPurple,
              //       startWidth: 10,
              //       endWidth: 10),
              //   GaugeRange(
              //       startValue: 100,
              //       endValue: 150,
              //       color: Colors.deepPurple,
              //       startWidth: 10,
              //       endWidth: 10)
              // ],
              pointers: <GaugePointer>[
                NeedlePointer(
                    knobStyle: KnobStyle(color: Colors.transparent),
                    enableDragging: true,
                    enableAnimation: true,
                    needleColor: Color(0xFFFF00E1),
                    needleEndWidth: 0,
                    needleLength: 0.95,
                    needleStartWidth: 3,
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF3639FF).withOpacity(0),
                        Color(0xFF0BDF52).withOpacity(0),
                        Color(0xFFFF00E1).withOpacity(0.1),
                        Color(0xFFFF00E1).withOpacity(.9)
                      ],
                    ),
                    value: speed)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text(speed.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300))),
                    angle: 90,
                    positionFactor: 0.0)
              ])
        ]);
  }
}
