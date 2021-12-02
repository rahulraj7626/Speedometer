import 'package:flutter/material.dart';
import 'package:speedodashboard/views/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget row1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('16:42 feb'),
      Icon(
        Icons.shortcut,
        color: color4,
      )
    ],
  );
}

Widget row2() {
  return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: color5,
        shape: BoxShape.circle,
      ),
      child: _getRadialGauge()

      //  Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       "137",
      //       style: TextStyle(fontSize: 40, color: Colors.white),
      //     ),
      //     Text(
      //       "ECO DRIVE",
      //       style: TextStyle(fontSize: 14, color: Colors.white),
      //     ),
      //   ],
      // ),
      );
}

Widget row3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('16:42 feb'),
      Icon(
        Icons.arrow_right_alt,
        color: color4,
      )
    ],
  );
}

Widget _getRadialGauge() {
  return SfRadialGauge(
      enableLoadingAnimation: true,
      title: GaugeTitle(
          text: '',
          textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      axes: <RadialAxis>[
        RadialAxis(
            axisLineStyle: AxisLineStyle(
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
                  knobStyle: KnobStyle(color: Colors.blueAccent),
                  enableDragging: true,
                  enableAnimation: true,
                  needleColor: Colors.deepOrange,
                  needleEndWidth: 1,
                  needleLength: 1,
                  needleStartWidth: 10,
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        Colors.orange.withOpacity(.8),
                        Colors.orange.withOpacity(.2)
                      ]),
                  value: 1)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: Text('90.0',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  angle: 90,
                  positionFactor: 0.9)
            ])
      ]);
}
