import 'package:flutter/material.dart';
import 'package:speedodashboard/views/constants.dart';
import 'package:speedodashboard/views/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      body: Container(
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
    );
  }
}
