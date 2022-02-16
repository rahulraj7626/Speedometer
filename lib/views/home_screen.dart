import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedodashboard/views/constants.dart';
import 'package:speedodashboard/views/widgets.dart';
import 'dart:math';
import 'package:intl/intl.dart';
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
  double api_speed = 0;
  var rng = Random();
  _randomColorFun() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        speed = rng.nextInt(140).toDouble() + 10;
        if (km > 10000) {
          km = 0;
        } else {
          km = km + speed / 10;
        }
      });
    });
  }

  _stopTimer() {
    _clockTimer!.cancel();
  }

  double km = 0;
  String date = DateFormat.MMMMd().format(DateTime.now());
  String timee = DateFormat.Hm().format(DateTime.now());
  sec5Timer() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        date = DateFormat.MMMMd().format(DateTime.now());
        timee = DateFormat.Hm().format(DateTime.now());
      });
    });
  }

  Future speedApi() async {
    var mapResponse;

    http.Response response;
    response = await http.get(
      Uri.parse('http://192.168.137.1/mat/data.php'),
    );
    if (response.statusCode == 200) {
      mapResponse = jsonDecode(response.body);
      print(mapResponse.toString());
      setState(() {
        api_speed = double.parse(mapResponse.toString());
      });
    } else {}
  }

  apiTimer() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      speedApi();
    });
  }

  _stopWalk() {
    setState(() {
      _isWalking = !_isWalking;
    });
  }

  @override
  void initState() {
    sec5Timer();
    apiTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1, child: Container(child: row1(date, timee))),
              Flexible(flex: 1, child: Container(child: row2())),
              Flexible(flex: 1, child: Container(child: row3(km))),
            ],
          ),
        ),
      ),
    );
  }

  Widget row2() {
    return Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        width: 250,
        decoration: const BoxDecoration(
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
                    knobStyle: const KnobStyle(color: Colors.transparent),
                    enableDragging: true,
                    enableAnimation: true,
                    needleColor: const Color(0xFFFF00E1),
                    needleEndWidth: 0,
                    needleLength: 0.95,
                    needleStartWidth: 3,
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        const Color(0xFF3639FF).withOpacity(0),
                        const Color(0xFF0BDF52).withOpacity(0),
                        const Color(0xFFFF00E1).withOpacity(0.1),
                        const Color(0xFFFF00E1).withOpacity(.9)
                      ],
                    ),
                    value: api_speed)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text(api_speed.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w300)),
                    angle: 90,
                    positionFactor: 0.0)
              ])
        ]);
  }
}
