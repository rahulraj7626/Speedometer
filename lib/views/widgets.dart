import 'package:flutter/material.dart';
import 'package:speedodashboard/views/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget row1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.shortcut,
        color: color4,
      ),
      Text('Turn right in 45 meters',
          style: TextStyle(
            fontSize: 8,
            color: Colors.white,
          )),
    ],
  );
}

// Widget row2(speed) {
//   return Container(
//       height: 250,
//       padding: EdgeInsets.all(10),
//       width: 250,
//       decoration: BoxDecoration(
//         image: DecorationImage(image: AssetImage('assets/speed.png')),
//         color: color5,
//         shape: BoxShape.circle,
//       ),
//       child: _getRadialGauge(speed));
// }

Widget row3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.bluetooth,
        color: color6,
      ),
      Text('Smartphone Connected',
          style: TextStyle(
            fontSize: 8,
            color: Colors.white,
          )),
    ],
  );
}

// Widget _getRadialGauge(speed) {
//   return SfRadialGauge(
//       enableLoadingAnimation: true,
//       title: const GaugeTitle(
//           text: '',
//           textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
//       axes: <RadialAxis>[
//         RadialAxis(
//             axisLineStyle: const AxisLineStyle(
//               thickness: 0.0,
//               thicknessUnit: GaugeSizeUnit.factor,
//               color: Colors.blueAccent,
//             ),
//             minimum: 0,
//             maximum: 150,
//             // ranges: <GaugeRange>[
//             //   GaugeRange(
//             //       startValue: 0,
//             //       endValue: 50,
//             //       color: Colors.black.withOpacity(0.1),
//             //       startWidth: 10,
//             //       endWidth: 10),
//             //   GaugeRange(
//             //       startValue: 50,
//             //       endValue: 100,
//             //       color: Colors.deepPurple,
//             //       startWidth: 10,
//             //       endWidth: 10),
//             //   GaugeRange(
//             //       startValue: 100,
//             //       endValue: 150,
//             //       color: Colors.deepPurple,
//             //       startWidth: 10,
//             //       endWidth: 10)
//             // ],
//             pointers: <GaugePointer>[
//               NeedlePointer(
//                   knobStyle: KnobStyle(color: Colors.transparent),
//                   enableDragging: true,
//                   enableAnimation: true,
//                   needleColor: Color(0xFFFF00E1),
//                   needleEndWidth: 0,
//                   needleLength: 0.95,
//                   needleStartWidth: 3,
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomRight,
//                     end: Alignment.topLeft,
//                     colors: [
//                       Color(0xFF3639FF).withOpacity(0),
//                       Color(0xFF0BDF52).withOpacity(0),
//                       Color(0xFFFF00E1).withOpacity(0.1),
//                       Color(0xFFFF00E1).withOpacity(.9)
//                     ],
//                   ),
//                   value: speed)
//             ],
//             annotations: <GaugeAnnotation>[
//               GaugeAnnotation(
//                   widget: Container(
//                       child: Text(speed.toString(),
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 25,
//                               fontWeight: FontWeight.w300))),
//                   angle: 90,
//                   positionFactor: 0.0)
//             ])
//       ]);
// }
