import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _getRadialGauge() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        title: const GaugeTitle(
            text: '',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                thicknessUnit: GaugeSizeUnit.factor,
                color: Colors.deepPurple,
              ),
              minimum: 0,
              maximum: 150,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 50,
                    color: Colors.deepPurple,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 50,
                    endValue: 100,
                    color: Colors.deepPurple,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 100,
                    endValue: 150,
                    color: Colors.deepPurple,
                    startWidth: 10,
                    endWidth: 10)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                    knobStyle: const KnobStyle(color: Colors.blueAccent),
                    enableDragging: true,
                    enableAnimation: true,
                    needleColor: Colors.deepOrange,
                    needleEndWidth: 1,
                    needleLength: 0.8,
                    needleStartWidth: 10,
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: const [
                          0.9,
                          0.1
                        ],
                        colors: [
                          Colors.orange,
                          Colors.orange.withOpacity(0.2)
                        ]),
                    value: 33)
              ],
              annotations: const <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text('90.0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 0.9)
              ])
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body: _getRadialGauge());
  }
}
